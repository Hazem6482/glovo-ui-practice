import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/app_colors.dart';
import '../constants/app_assets.dart';
import 'main_screen.dart';
import 'check_number_screen.dart';

class VerificationScreen extends StatefulWidget {
  final String phoneNumber;

  const VerificationScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  int _secondsRemaining = 27;
  int _totalSecondsElapsed = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
    // Auto focus first input
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes[0].requestFocus();
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (_secondsRemaining > 0) {
            _secondsRemaining--;
          }
          _totalSecondsElapsed++;
          
          if (_totalSecondsElapsed >= 30) {
            timer.cancel();
            _navigateToCheckNumber();
          }
        });
      }
    });
  }

  void _navigateToCheckNumber() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CheckNumberScreen(phoneNumber: widget.phoneNumber),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onCodeChanged(int index, String value) {
    if (value.isNotEmpty && index < 3) {
      _focusNodes[index + 1].requestFocus();
    }

    // Check if all fields are filled
    if (_controllers.every((c) => c.text.isNotEmpty)) {
      // Navigate to main screen
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const MainScreen()),
            (route) => false,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              // Back button
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back, size: 24, color: Color(0xFF1A1A1A)),
              ),
              const SizedBox(height: 24),
              // Phone code icon
              SizedBox(
                width: 48,
                height: 48,
                child: SvgPicture.asset(
                  AppAssets.authPhoneCodeIcon,
                ),
              ),
              const SizedBox(height: 10),
              // Title
              const Text(
                'Saisissez le code',
                style: TextStyle(
                  fontFamily: 'GlovoBlack',
                  fontSize: 24,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 12),
              // Subtitle
              Text.rich(
                TextSpan(
                  style: const TextStyle(
                    fontFamily: 'GlovoBook',
                    fontSize: 15,
                    color: Color(0xFF6B6B6B),
                    height: 1.4,
                  ),
                  children: [
                    const TextSpan(text: 'Insérez le code à 4 chiffres que nous avons envoyé (SMS) au '),
                    TextSpan(
                      text: widget.phoneNumber,
                      style: const TextStyle(fontFamily: 'GlovoBold', color: Color(0xFF1A1A1A)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              // OTP inputs
              Row(
                children: List.generate(4, (index) {
                  return Container(
                    width: 56,
                    height: 56,
                    margin: const EdgeInsets.only(right: 12),
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: const TextStyle(
                        fontFamily: 'GlovoBold',
                        fontSize: 22,
                        color: Color(0xFF1A1A1A),
                      ),
                      decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColors.border, width: 1.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColors.border, width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColors.primaryTeal, width: 2),
                        ),
                      ),
                      onChanged: (value) => _onCodeChanged(index, value),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 15),
              // Resend timer
              Text(
                _secondsRemaining > 0
                    ? 'Renvoyer le code dans 00:${_secondsRemaining.toString().padLeft(2, '0')}'
                    : 'Renvoyer le code',
                style: TextStyle(
                  fontFamily: 'GlovoBook',
                  fontSize: 14,
                  color: _secondsRemaining > 0 ? Colors.grey[500] : AppColors.primaryTeal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
