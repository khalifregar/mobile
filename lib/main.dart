import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propedia/presentation/core/interceptor/loginterceptor.dart';
import 'package:propedia/presentation/home/cubit/property_cubit.dart';
import 'package:propedia/presentation/home/widgets/services/notification_service.dart';
import 'package:provider/provider.dart';
import 'package:propedia/presentation/splash/pages/splash_page.dart';
import 'package:propedia/presentation/home/pages/chats/provider/chat_provider.dart';
import 'package:propedia/services/auth/auth_api_services.dart';
import 'package:propedia/services/stores/properties_api_services.dart';
import 'package:propedia/presentation/auth/cubit/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Inisialisasi notifikasi
  await NotificationService.init();

  final dio = DioClient().dio;
  final authApi = AuthApiService(dio);
  final propertyApi = PropertiesApiService(dio);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        BlocProvider(create: (_) => AuthCubit(authApi)),
        BlocProvider(create: (_) => PropertyCubit(propertyApi)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'App',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const SplashScreenPage(),
        );
      },
    );
  }
}
