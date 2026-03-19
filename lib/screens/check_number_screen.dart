import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/app_colors.dart';
import '../constants/app_assets.dart';

class CheckNumberScreen extends StatelessWidget {
  final String phoneNumber;

  const CheckNumberScreen({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              // Title
              const Text(
                'Le numéro est-il\ncorrect ?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'GlovoBlack',
                  fontSize: 24,
                  color: Color(0xFF1A1A1A),
                  height: 1.2,
                ),
              ),
              const Spacer(flex: 1),
              // Illustration
              Stack(
                alignment: Alignment.center,
                children: [
                  // Placeholder for the illustration since we don't have the exact one
                  // We use a combination of existing icons to mimic it
                  Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SvgPicture.asset(
                            AppAssets.questionMarkIcon,
                            width: 150,
                            height: 150,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 1),
              // Description
              Text.rich(
                TextSpan(
                  style: const TextStyle(
                    fontFamily: 'GlovoBook',
                    fontSize: 16,
                    color: Color(0xFF1A1A1A),
                    height: 1.5,
                  ),
                  children: [
                    const TextSpan(text: "Nous n'arrivons pas à vérifier\n"),
                    TextSpan(
                      text: phoneNumber,
                      style: const TextStyle(fontFamily: 'GlovoBold'),
                    ),
                    const TextSpan(text: "."),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Veuillez le contrôler avant que nous réessayions.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'GlovoBook',
                  fontSize: 15,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const Spacer(flex: 2),
              // Action Buttons
              SizedBox(
                width: double.infinity,
                height: 42,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryTeal,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                  child: const Text(
                    'Modifier le numéro de',
                    style: TextStyle(fontFamily: 'GlovoBold', fontSize: 16),
                  ),
                ),
              ),
              // const SizedBox(height: 16),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Oui, il est correct',
                  style: TextStyle(
                    fontFamily: 'GlovoBold',
                    fontSize: 16,
                    color: AppColors.primaryTeal,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
