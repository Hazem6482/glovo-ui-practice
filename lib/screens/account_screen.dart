import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_assets.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: _buildMenuList(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 12,
        left: 20,
        right: 20,
        bottom: 32,
      ),
      decoration: const BoxDecoration(
        color: AppColors.bgYellow,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Aide button
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.primaryTeal,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Aide',
                style: TextStyle(
                  fontFamily: 'GlovoBold',
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // User info
          Row(
            children: [
              // Avatar
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.primaryTeal.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    'B',
                    style: TextStyle(
                      fontFamily: 'GlovoBold',
                      fontSize: 18,
                      color: AppColors.primaryTeal,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'BD',
                      style: TextStyle(
                        fontFamily: 'GlovoBold',
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Connectez-vous à vos amis',
                      style: TextStyle(
                        fontFamily: 'GlovoBook',
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.85),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.white, size: 24),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuList() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: ListView(
        padding: const EdgeInsets.only(top: 24),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Compte',
              style: TextStyle(
                fontFamily: 'GlovoBlack',
                fontSize: 24,
                color: Color(0xFF1A1A1A),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _menuItem(AppAssets.historique, 'Historique des commandes'),
          _menuItem(AppAssets.filledPerson, 'Compte'),
          _menuItem(AppAssets.codePromo, 'Codes promo'),
          _menuItem(AppAssets.language, 'Langue'),
          _menuItem(AppAssets.info, 'FAQ'),
          _menuItem(AppAssets.notification, 'Notifications'),
          _menuItem(AppAssets.supprimer, 'Supprimer mon compte et mes données'),
          _menuItem(AppAssets.deconnexion, 'Confirmer la déconnexion'),
        ],
      ),
    );
  }

  Widget _menuItem(String iconPath, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[100]!, width: 1),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            width: 24,
            height: 24,
            errorBuilder: (_, _, _) => Icon(Icons.circle_outlined, size: 24, color: Colors.grey[400]),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: 'GlovoMedium',
                fontSize: 15,
                color: Color(0xFF1A1A1A),
              ),
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.grey[400], size: 22),
        ],
      ),
    );
  }
}
