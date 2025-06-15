import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:propedia/models/dtos/auth/auth_dto.dart';
import 'package:propedia/models/request/auth/auth_request.dart';
import 'package:propedia/presentation/auth/widgets/utils/register_utils.dart';
import 'package:propedia/services/auth/auth_api_services.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthApiService _authApi;

  AuthCubit(this._authApi) : super(const AuthState.initial());

  Future<void> login(LoginRequest request) async {
    emit(const AuthState.loading());
    try {
      final response = await _authApi.universalLogin(request.toJson());
      final dto = LoginResponseDto.fromJson(response.data);

      if (dto.data != null) {
        final d = dto.data!;
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("access_token", d.token);
        await prefs.setString("user_id", d.id.toString());
        await prefs.setString("role", d.role); // ✅ FIXED

        final user = UserDto(
          id: d.id,
          username: d.username,
          email: d.email,
          phone: d.phone,
          role: d.role,
          address: d.address ?? '',
          isVerified: true,
          isActive: true,
          createdAt: d.createdAt,
          updatedAt: d.updatedAt,
        );

        emit(AuthState.authenticated(user));
      } else {
        emit(AuthState.error(dto.message ?? "Login gagal: data kosong"));
      }
    } catch (e) {
      String errorMessage = "Login gagal: ${e.toString()}";
      if (e is DioException && e.response?.data is Map) {
        errorMessage =
            e.response!.data['message'] ??
            e.response!.statusMessage ??
            errorMessage;
      }
      emit(AuthState.error(errorMessage));
    }
  }

  Future<void> register(
    RegisterRequest request, {
    required UserType userType,
  }) async {
    emit(const AuthState.loading());
    try {
      if (userType == UserType.admin) {
        await _authApi.adminRegister(request.toJson());
      } else if (userType == UserType.penjual) {
        await _authApi.penjualRegister(request.toJson());
      } else if (userType == UserType.pembeli) {
        await _authApi.pembeliRegister(request.toJson());
      } else {
        emit(const AuthState.error("Jenis pengguna tidak valid untuk registrasi."));
        return;
      }
      emit(const AuthState.loggedOut());
    } catch (e) {
      String errorMessage = "Register gagal: ${e.toString()}";
      if (e is DioException && e.response?.data is Map) {
        errorMessage =
            e.response!.data['message'] ??
            e.response!.statusMessage ??
            errorMessage;
      }
      emit(AuthState.error(errorMessage));
    }
  }

  Future<void> fetchMyProfile() async {
    emit(const AuthState.loading());
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("access_token");

      if (token == null || token.isEmpty) {
        emit(const AuthState.error("Token tidak ditemukan."));
        return;
      }

      final response = await _authApi.getMyProfile("Bearer $token");
      final data = response.data['data'];
      final user = UserDto.fromJson(data);
      emit(AuthState.authenticated(user));
    } catch (e) {
      String errorMessage = "Gagal ambil profil: ${e.toString()}";
      if (e is DioException && e.response?.data is Map) {
        errorMessage =
            e.response!.data['message'] ??
            e.response!.statusMessage ??
            errorMessage;
      }
      emit(AuthState.error(errorMessage));
    }
  }

  Future<void> logout() async {
    emit(const AuthState.loading());
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("access_token");
      final id = prefs.getString("user_id");

      if (token == null || token.isEmpty || id == null) {
        emit(const AuthState.error("Token atau ID tidak ditemukan."));
        return;
      }

      await _authApi.logout(id, "Bearer $token");
      await prefs.remove("access_token");
      await prefs.remove("user_id");
      await prefs.remove("role"); // ✅ tambahkan juga untuk bersih

      emit(const AuthState.loggedOut());
    } catch (e) {
      String errorMessage = "Logout gagal: ${e.toString()}";
      if (e is DioException && e.response?.data is Map) {
        errorMessage =
            e.response!.data['message'] ??
            e.response!.statusMessage ??
            errorMessage;
      }
      emit(AuthState.error(errorMessage));
    }
  }

  Future<void> sendOtp(SendOtpRequest request) async {
    emit(const AuthState.loading());
    try {
      final httpResponse = await _authApi.sendOtp(request.toJson());
      if (httpResponse.response.statusCode == 200 ||
          httpResponse.response.statusCode == 201) {
        emit(const AuthState.otpSent());
      } else {
        emit(AuthState.error(
            httpResponse.response.statusMessage ?? "Gagal kirim OTP"));
      }
    } catch (e) {
      String errorMessage = "Gagal kirim OTP: ${e.toString()}";
      if (e is DioException && e.response?.data is Map) {
        errorMessage =
            e.response!.data['message'] ??
            e.response!.statusMessage ??
            errorMessage;
      }
      emit(AuthState.error(errorMessage));
    }
  }

  Future<void> verifyOtp(VerifyOtpRequest request) async {
    emit(const AuthState.loading());
    try {
      final httpResponse = await _authApi.verifyOtp(request.toJson());
      if (httpResponse.response.statusCode == 200) {
        final data = httpResponse.data;

        final token = data['token'];
        final userJson = data['user'];

        if (token != null && userJson != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString("access_token", token);
          await prefs.setString("user_id", userJson['id'].toString());
          await prefs.setString("role", userJson['role']); // ✅ FIXED

          final user = UserDto(
            id: userJson['id'],
            username: userJson['username'],
            email: userJson['email'],
            phone: userJson['phone'],
            role: userJson['role'],
            address: userJson['address'] ?? '',
            isVerified: true,
            isActive: true,
            createdAt: userJson['created_at'],
            updatedAt: userJson['updated_at'],
          );

          emit(AuthState.authenticated(user));
        } else {
          emit(const AuthState.error("Verifikasi gagal: data tidak lengkap."));
        }
      } else {
        emit(AuthState.error(
            httpResponse.response.statusMessage ?? "OTP verifikasi gagal"));
      }
    } catch (e) {
      String errorMessage = "OTP verifikasi gagal: ${e.toString()}";
      if (e is DioException && e.response?.data is Map) {
        errorMessage =
            e.response!.data['message'] ??
            e.response!.statusMessage ??
            errorMessage;
      }
      emit(AuthState.error(errorMessage));
    }
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("access_token");

    if (token == null || token.isEmpty) {
      emit(const AuthState.loggedOut());
      return;
    }

    try {
      final response = await _authApi.getMyProfile("Bearer $token");
      final data = response.data['data'];
      final user = UserDto.fromJson(data);
      emit(AuthState.authenticated(user));
    } catch (_) {
      emit(const AuthState.loggedOut());
    }
  }
}
