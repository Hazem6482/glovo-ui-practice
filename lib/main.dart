import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants/app_colors.dart';
import 'screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const GlovoApp());
}

class GlovoApp extends StatelessWidget {
  const GlovoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glovo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryYellow,
        scaffoldBackgroundColor: AppColors.bgWhite,
        fontFamily: 'GlovoBook',
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryYellow,
          primary: AppColors.primaryTeal,
          surface: AppColors.bgWhite,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.bgWhite,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.textPrimary),
          titleTextStyle: TextStyle(
            fontFamily: 'GlovoBold',
            fontSize: 20,
            color: AppColors.textPrimary,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.bgWhite,
          selectedItemColor: AppColors.primaryTeal,
          unselectedItemColor: AppColors.textMuted,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(fontFamily: 'GlovoMedium', fontSize: 11),
          unselectedLabelStyle: TextStyle(fontFamily: 'GlovoMedium', fontSize: 11),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
