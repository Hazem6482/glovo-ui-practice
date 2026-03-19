import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_assets.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text(
                'Commandes',
                style: TextStyle(
                  fontFamily: 'GlovoBlack',
                  fontSize: 28,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 24),
              // Track orders card
              _buildTrackOrderCard(),
              const SizedBox(height: 28),
              // Continue order section
              const Text(
                'Poursuivre la commande',
                style: TextStyle(
                  fontFamily: 'GlovoBold',
                  fontSize: 20,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 16),
              _buildEmptyCartCard(),
              const SizedBox(height: 24),
              // History link
              _buildHistoryCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrackOrderCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            AppAssets.suivezCommandes,
            width: 64,
            height: 64,
            errorBuilder: (_, _, _) => Icon(Icons.local_shipping_outlined, size: 48, color: Colors.grey[400]),
          ),
          const SizedBox(height: 16),
          const Text(
            'Suivez vos commandes',
            style: TextStyle(
              fontFamily: 'GlovoBold',
              fontSize: 18,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Vos commandes en cours seront\nrépertoriées ici',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'GlovoBook',
              fontSize: 14,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyCartCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        children: [
          Image.asset(
            AppAssets.aucunPanier,
            width: 64,
            height: 64,
            errorBuilder: (_, _, _) => Icon(Icons.shopping_cart_outlined, size: 48, color: Colors.grey[400]),
          ),
          const SizedBox(height: 16),
          const Text(
            'Aucun panier pour le moment',
            style: TextStyle(
              fontFamily: 'GlovoBold',
              fontSize: 16,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Ajoutez des articles provenant des\nétablissements pour créer de nouveaux\npaniers',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'GlovoBook',
              fontSize: 14,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryTeal.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Image.asset(
            AppAssets.consulterHistorique,
            width: 48,
            height: 48,
            errorBuilder: (_, _, _) => Icon(Icons.history, size: 32, color: Colors.grey[400]),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Besoin de voir ou répéter les commandes passées ?',
                  style: TextStyle(
                    fontFamily: 'GlovoMedium',
                    fontSize: 13,
                    color: Colors.grey[700],
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Consulter l\'historique de vos commandes',
                  style: TextStyle(
                    fontFamily: 'GlovoBold',
                    fontSize: 13,
                    color: AppColors.primaryTeal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
