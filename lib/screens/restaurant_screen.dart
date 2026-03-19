import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_assets.dart';
import '../widgets/product_card.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(child: _buildStoreInfo()),
          SliverToBoxAdapter(child: _buildStats()),
          SliverToBoxAdapter(child: _buildPriceNotice()),
          SliverToBoxAdapter(child: _buildTabBar()),
          SliverToBoxAdapter(child: _buildPromotionsSection()),
          SliverToBoxAdapter(child: _buildTopSalesSection()),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      backgroundColor: AppColors.primaryYellow,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 4),
            ],
          ),
          child: const Icon(Icons.arrow_back, color: Color(0xFF1A1A1A), size: 20),
        ),
      ),
      actions: [
        _actionButton(Icons.search),
        _actionButton(Icons.favorite, isFilled: true, color: Colors.red),
        _actionButton(Icons.more_horiz),
        const SizedBox(width: 8),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              AppAssets.baguettePack1,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(color: AppColors.primaryYellow),
            ),
            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.1),
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.3),
                  ],
                ),
              ),
            ),
            // "NEW" banner text
            const Positioned(
              top: 50,
              right: 20,
              child: Text(
                'NEW',
                style: TextStyle(
                  fontFamily: 'GlovoBlack',
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionButton(IconData icon, {bool isFilled = false, Color? color}) {
    return Container(
      width: 36,
      height: 36,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 4),
        ],
      ),
      child: Icon(
        icon,
        size: 18,
        color: color ?? const Color(0xFF1A1A1A),
      ),
    );
  }

  Widget _buildStoreInfo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Store logo
          Container(
            width: 48,
            height: 48,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderLight),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                AppAssets.tacothLogo,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => const Icon(Icons.store, size: 24),
              ),
            ),
          ),
          // Name
          const Text(
            'Tacoth',
            style: TextStyle(
              fontFamily: 'GlovoBlack',
              fontSize: 26,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 8),
          // Tags
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryYellow.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.primaryYellow.withValues(alpha: 0.3)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.discount_outlined, size: 14, color: Colors.orange[700]),
                    const SizedBox(width: 4),
                    Text(
                      '-30% sélection',
                      style: TextStyle(
                        fontFamily: 'GlovoBold',
                        fontSize: 12,
                        color: Colors.orange[700],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.border),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, size: 14, color: AppColors.primaryTeal),
                    SizedBox(width: 4),
                    Text(
                      'Les mieux notés ›',
                      style: TextStyle(
                        fontFamily: 'GlovoMedium',
                        fontSize: 12,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          _statItem(Icons.thumb_up_alt_outlined, '92%', null),
          const SizedBox(width: 24),
          _statItem(Icons.access_time, '15-30\'', null),
          const SizedBox(width: 24),
          _statItem(Icons.delivery_dining, '0,500 DT', 'Gratuit'),
        ],
      ),
    );
  }

  Widget _statItem(IconData icon, String value, String? badge) {
    return Column(
      children: [
        Icon(icon, size: 24, color: Colors.grey[600]),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontFamily: 'GlovoMedium', fontSize: 13, color: Color(0xFF1A1A1A)),
        ),
        if (badge != null) ...[
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryTeal),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              badge,
              style: const TextStyle(fontFamily: 'GlovoMedium', fontSize: 11, color: AppColors.primaryTeal),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPriceNotice() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Text(
        'Les prix barrés indiquent le prix le plus bas au cours du/des 3 jours précédant la réduction',
        style: TextStyle(fontFamily: 'GlovoBook', fontSize: 12, color: Colors.grey[500], height: 1.3),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            _tab('Promotions', true),
            _tab('Top des ventes', false),
            _tab('Les Tacoths Class...', false),
          ],
        ),
      ),
    );
  }

  Widget _tab(String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isActive ? AppColors.primaryTeal : Colors.transparent,
            width: 2,
          ),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: isActive ? 'GlovoBold' : 'GlovoMedium',
          fontSize: 14,
          color: isActive ? AppColors.primaryTeal : Colors.grey[500],
        ),
      ),
    );
  }

  Widget _buildPromotionsSection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Promotions',
                style: TextStyle(fontFamily: 'GlovoBold', fontSize: 18, color: Color(0xFF1A1A1A)),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[600]),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 210,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ProductCard(
                  imagePath: AppAssets.baguettePack1,
                  name: 'Ultimate Beef',
                  price: '12,250 DT',
                  oldPrice: '17,500 DT',
                  discount: '-30%',
                ),
                ProductCard(
                  imagePath: AppAssets.baguettePack2,
                  name: 'Spicy Chicken',
                  price: '9,030 DT',
                  oldPrice: '12,900 DT',
                  discount: '-30%',
                ),
                ProductCard(
                  imagePath: AppAssets.baguettePack3,
                  name: 'Beef Tacoth',
                  price: '9,030 DT',
                  oldPrice: '12,900 DT',
                  discount: '-30%',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopSalesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top des ventes',
            style: TextStyle(fontFamily: 'GlovoBold', fontSize: 18, color: Color(0xFF1A1A1A)),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              'Informations sur les frais ⓘ',
              style: TextStyle(fontFamily: 'GlovoBook', fontSize: 13, color: Colors.grey[500]),
            ),
          ),
        ],
      ),
    );
  }
}
