import 'package:dio/dio.dart';
import 'package:propedia/presentation/core/constant/api_constant.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST('/api/admin/register')
  Future<HttpResponse> adminRegister(@Body() requestBody);

  @POST('/api/penjual/register')
  Future<HttpResponse> penjualRegister(@Body() requestBody);

  @POST('/api/pembeli/register')
  Future<HttpResponse> pembeliRegister(@Body() requestBody);

  @POST('/api/login')
  Future<HttpResponse> universalLogin(@Body() requestBody);

@GET('/api/me')
Future<HttpResponse> getMyProfile(
  @Header("Authorization") String token,
);


  @PATCH('/api/profile/{id}')
  Future<HttpResponse> updateProfile(@Path('id') String id, @Body() updates);

  @POST('/api/logout/{id}')
  Future<HttpResponse<void>> logout(
    @Path('id') String id,
    @Header("Authorization") String token,
  );

  @POST('/api/refresh')
  Future<HttpResponse> refreshToken();

  @POST('/api/otp/send')
  Future<HttpResponse> sendOtp(@Body() requestBody);

  @POST('/api/otp/verify')
  Future<HttpResponse> verifyOtp(@Body() requestBody);
}