import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../constants/app_colors.dart';
import '../constants/app_assets.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgYellow,
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: Lottie.asset(
            AppAssets.splashLogo,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              // Fallback to text logo
              return const Text(
                'Glovo',
                style: TextStyle(
                  fontFamily: 'GlovoBold',
                  fontSize: 48,
                  color: AppColors.primaryTeal,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
