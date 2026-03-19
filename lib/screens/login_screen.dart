import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import '../constants/app_colors.dart';
import '../constants/app_assets.dart';
import 'verification_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  String _selectedPrefix = '+216';
  String _selectedMethod = 'SMS';
  bool _showOtherMethods = false;
  bool _isLoading = false;
  final TextEditingController _phoneController = TextEditingController();
  late final AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 80),
    )..repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite, // Fix: Changed from bgYellow to remove bottom yellow bar
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Yellow header with Glovo logo
                _buildHeader(),
                // Main content container with top radius
                Container(
                  width: double.infinity,
                  transform: Matrix4.translationValues(0, -20, 0),
                  decoration: const BoxDecoration(
                    color: AppColors.bgWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      // Promo banner integrated into the layout
                      _buildPromoBanner(),
                      const SizedBox(height: 4),
                      // Welcome section
                      _buildWelcomeSection(),
                      // Phone input
                      _buildPhoneInput(),
                      const SizedBox(height: 8),
                      // WhatsApp / SMS buttons
                      _buildMethodButtons(),
                      const SizedBox(height: 14),
                      // Divider with "ou avec"
                      _buildDivider(),
                      const SizedBox(height: 16),
                      // Google button
                      _buildGoogleButton(),
                      const SizedBox(height: 16),
                      // Other methods
                      _buildOtherMethods(),
                      const SizedBox(height: 32),
                      // Terms
                      _buildTerms(),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (_isLoading) _buildLoadingOverlay(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return ClipRect(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 8, bottom: 8),
        decoration: const BoxDecoration(color: AppColors.bgYellow),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            // Rotating background food image
            Positioned.fill(
              child: Transform.scale(
                scale: 7,
                child: RotationTransition(
                  turns: _rotationController,
                  child: Image.asset(
                    AppAssets.signInLanding,
                    fit: BoxFit.contain,
                    errorBuilder: (_, _, _) => const SizedBox(),
                  ),
                ),
              ),
            ),
            // Logo
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: SvgPicture.asset(
                  AppAssets.glovoVectorLogo,
                  width: 140,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primaryTeal,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(
          0xFFFEF2E4,
        ), // Light cream background from screenshot
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // New SVG icon
          SvgPicture.asset(
            AppAssets.bagMotorbikeGift,
            width: 54,
            height: 54,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Livraison offerte sur la 1ère commande !',
                  style: TextStyle(
                    fontFamily: 'GlovoBold',
                    fontSize: 16,
                    color: Color(0xFF1A1A1A),
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Pour les nouveaux clients uniquement',
                  style: TextStyle(
                    fontFamily: 'GlovoBook',
                    fontSize: 14,
                    color: Color(0xFF1A1A1A),
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return const Column(
      children: [
        Text(
          'Bienvenue',
          style: TextStyle(
            fontFamily: 'GlovoBlack',
            fontSize: 24,
            color: Color(0xFF1A1A1A),
          ),
        ),
        Text(
          'Commençons par votre numéro de\ntéléphone',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'GlovoBook',
            fontSize: 15,
            color: Color(0xFF6B6B6B),
            height: 1.4,
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }

  Widget _buildPhoneInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Prefix section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Préfixe',
                style: TextStyle(
                  fontFamily: 'GlovoMedium',
                  fontSize: 13,
                  color: Colors.grey[600],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedPrefix = _selectedPrefix == '+216'
                        ? '+33'
                        : '+216';
                  });
                },
                child: Container(
                  height: 38, // Fixed height for consistent alignment
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.border),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _selectedPrefix == '+216' ? '🇹🇳' : '🇫🇷',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _selectedPrefix,
                        style: const TextStyle(
                          fontFamily: 'GlovoMedium',
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        size: 20,
                        color: Color(0xFF6B6B6B),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          // Phone number input
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Numéro de téléphone',
                  style: TextStyle(
                    fontFamily: 'GlovoMedium',
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                  height: 38, // Matched height
                  child: TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(
                      fontFamily: 'GlovoMedium',
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.border),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.border),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.primaryTeal,
                          width: 1.5,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMethodButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() => _selectedMethod = 'WhatsApp');
                _handleNavigation();
              },
              child: Container(
                height: 38, // Pill button height
                decoration: BoxDecoration(
                  color: _selectedMethod == 'WhatsApp'
                      ? AppColors.primaryTeal
                      : Colors.white,
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(
                    color: _selectedMethod == 'WhatsApp'
                        ? AppColors.primaryTeal
                        : AppColors.border,
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: Text(
                    'WhatsApp',
                    style: TextStyle(
                      fontFamily: 'GlovoBold',
                      fontSize: 15,
                      color: _selectedMethod == 'WhatsApp'
                          ? Colors.white
                          : const Color(0xFF1A1A1A),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() => _selectedMethod = 'SMS');
                _handleNavigation();
              },
              child: Container(
                height: 38, // Pill button height
                decoration: BoxDecoration(
                  color: _selectedMethod == 'SMS'
                      ? AppColors.primaryTeal
                      : Colors.white,
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(
                    color: _selectedMethod == 'SMS'
                        ? AppColors.primaryTeal
                        : AppColors.border,
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: Text(
                    'SMS',
                    style: TextStyle(
                      fontFamily: 'GlovoBold',
                      fontSize: 15,
                      color: _selectedMethod == 'SMS'
                          ? Colors.white
                          : const Color(0xFF1A1A1A),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleNavigation() async {
    if (_phoneController.text.isNotEmpty) {
      setState(() => _isLoading = true);
      
      // Artificial delay to show the animation
      await Future.delayed(const Duration(seconds: 2));
      
      if (mounted) {
        setState(() => _isLoading = false);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => VerificationScreen(
              phoneNumber: '$_selectedPrefix${_phoneController.text}',
            ),
          ),
        );
      }
    }
  }

  Widget _buildLoadingOverlay() {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Lottie.asset(
              AppAssets.lottieLoadingGray,
              width: 60,
              height: 60,
              repeat: true,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Expanded(child: Divider(color: AppColors.border)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'ou avec',
              style: TextStyle(
                fontFamily: 'GlovoBook',
                fontSize: 13,
                color: Colors.grey[500],
              ),
            ),
          ),
          const Expanded(child: Divider(color: AppColors.border)),
        ],
      ),
    );
  }

  Widget _buildGoogleButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          // Navigate to main screen for demo
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) =>
                  const VerificationScreen(phoneNumber: '+21612345678'),
            ),
          );
        },
        child: Container(
          width: double.infinity, // Fix: Added width to prevent shrink-wrapping
          height: 38, // Pill button height - matched to other buttons
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.border, width: 1.5),
            borderRadius: BorderRadius.circular(19),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 12,
                child: SvgPicture.asset(
                  AppAssets.googleIcon,
                  width: 20,
                  height: 20,
                ),
              ),
              const Text(
                'Google',
                style: TextStyle(
                  fontFamily: 'GlovoBold',
                  fontSize: 15,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtherMethods() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
      child: _showOtherMethods
          ? Column(
              key: const ValueKey('expanded_methods'),
              children: [
                // Facebook Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    height: 38,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.border, width: 1.5),
                      borderRadius: BorderRadius.circular(19),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 12,
                          child: SvgPicture.asset(
                            AppAssets.facebookIcon,
                            width: 20,
                            height: 20,
                          ),
                        ),
                        const Text(
                          'Facebook',
                          style: TextStyle(
                            fontFamily: 'GlovoBold',
                            fontSize: 15,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // E-mail Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    height: 38,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.border, width: 1.5),
                      borderRadius: BorderRadius.circular(19),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 12,
                          child: SvgPicture.asset(
                            AppAssets.emailIcon,
                            width: 20,
                            height: 20,
                            colorFilter: const ColorFilter.mode(
                              Color(0xFF1A1A1A),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        const Text(
                          'E-mail',
                          style: TextStyle(
                            fontFamily: 'GlovoBold',
                            fontSize: 15,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : GestureDetector(
              key: const ValueKey('toggle_button'),
              onTap: () => setState(() => _showOtherMethods = true),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Autres méthodes',
                    style: TextStyle(
                      fontFamily: 'GlovoBold',
                      fontSize: 15,
                      color: AppColors.primaryTeal,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.primaryTeal,
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildTerms() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text.rich(
        TextSpan(
          style: TextStyle(
            fontFamily: 'GlovoBook',
            fontSize: 12,
            color: Colors.grey[500],
            height: 1.5,
          ),
          children: const [
            TextSpan(text: 'En continuant, vous acceptez automatiquement nos '),
            TextSpan(
              text: 'Conditions d\'utilisation',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            TextSpan(text: ', notre '),
            TextSpan(
              text: 'Politique de confidentialité',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            TextSpan(text: ' et notre '),
            TextSpan(
              text: 'Politique en matière de cookies',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            TextSpan(text: '.'),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
