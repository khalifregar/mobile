import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propedia/constant/app_constant.dart';
import 'package:propedia/controller/splash_controller.dart';
import 'package:propedia/presentation/auth/cubit/auth_cubit.dart';
import 'package:propedia/presentation/auth/cubit/auth_state.dart';
import 'package:propedia/presentation/auth/pages/login_page.dart';
import 'package:propedia/presentation/home/pages/dashboard_page.dart';
import 'package:propedia/presentation/onboarding/pages/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with TickerProviderStateMixin {
  final SplashController _controller = SplashController();

  @override
  void initState() {
    super.initState();
    _controller.init(
      vsync: this,
      onExplosionComplete: () async {
        final prefs = await SharedPreferences.getInstance();
        final hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
        final token = prefs.getString('access_token');

        if (token != null && token.isNotEmpty) {
          try {
            await context.read<AuthCubit>().fetchMyProfile();
          } catch (e) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const LoginPage()),
            );
          }
        } else if (!hasSeenOnboarding) {
          await prefs.setBool('hasSeenOnboarding', true);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const OnboardingPage()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LoginPage()),
          );
        }
      },
      triggerBounce: () => setState(() {}),
      triggerExplosion: () => setState(() {}),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          authenticated: (user) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => DashboardPage(
                  userName: user.username ?? 'Pengguna',
                  userEmail: user.email ?? '',
                  userRole: user.role ?? 'user',
                ),
              ),
            );
          },
          error: (_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const LoginPage()),
            );
          },
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            if (_controller.startExplosion)
              AnimatedBuilder(
                animation: _controller.circleExplosion,
                builder: (_, __) {
                  final size = _controller.circleExplosion.value;
                  return Positioned(
                    left: (screenSize.width / 2) - (size / 2),
                    top: (screenSize.height / 2) - (size / 2),
                    child: Container(
                      width: size,
                      height: size,
                      decoration: const BoxDecoration(
                        color: Colors.lightGreen,
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                },
              ),
            if (!_controller.startExplosion)
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SlideTransition(
                      position: _controller.circleOffset,
                      child: ScaleTransition(
                        scale: _controller.showBounce
                            ? _controller.bounceScale
                            : const AlwaysStoppedAnimation(1.0),
                        child: Container(
                          width: 40.w,
                          height: 40.h,
                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: const BoxDecoration(
                            color: Colors.lightGreen,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    SlideTransition(
                      position: _controller.textOffset,
                      child: Text(
                        kAppName,
                        style: TextStyle(
                          fontSize: 34.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: kMindHubFontFamily,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
