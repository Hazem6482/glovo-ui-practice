import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_assets.dart';
import '../widgets/address_bar.dart';
import '../widgets/store_card.dart';
import '../widgets/white_curved_splitter.dart';
import 'search_screen.dart';

class ExplorerScreen extends StatelessWidget {
  const ExplorerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            _buildSearchBar(context),
            _buildIdeaCard(),
            _buildTrendingSection(context),
            _buildFavoritesSection(),
            _buildAvailableSection(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: AppColors.bgYellow),
      child: Stack(
        children: [
          // Background Image
          Positioned(
            right: -20,
            bottom: -56,
            child: Image.asset(
              AppAssets.heroSectionImage,
              width: 380,
              height: 360,
              fit: BoxFit.contain,
              errorBuilder: (_, _, _) =>
                  const Icon(Icons.search, size: 80, color: Colors.white10),
            ),
          ),
          // Address Bar at the very top
          Positioned(
            top: MediaQuery.of(context).padding.top + 12,
            left: 0,
            right: 0,
            child: const Center(child: AddressBar()),
          ),
          // Content Overlay
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 115,
              bottom: 60,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Explorer',
                    style: TextStyle(
                      fontFamily: 'GlovoBlack',
                      fontSize: 28,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Curves Splitter at the bottom
          const Positioned(
            left: 0,
            right: 0,
            bottom: -1, // Slightly overlap to prevent thin line gaps
            child: WhiteCurvedSplitter(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SearchScreen()),
        );
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Color(0xffd6d7d8)),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey[500], size: 22),
            const SizedBox(width: 10),
            Text(
              'Recherche dans Explorer',
              style: TextStyle(
                fontFamily: 'GlovoBook',
                fontSize: 15,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIdeaCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryTeal.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(
            AppAssets.starIcon,
            width: 48,
            height: 48,
            errorBuilder: (_, _, _) => const Icon(
              Icons.star,
              color: AppColors.primaryYellow,
              size: 36,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Besoin d\'idées ?',
                  style: TextStyle(
                    fontFamily: 'GlovoBold',
                    fontSize: 16,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Trouvez des établissements tendance, méconnus ou adorés par vos amis.',
                  style: TextStyle(
                    fontFamily: 'GlovoBook',
                    fontSize: 13,
                    color: Color(0xFF6B6B6B),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const Text(
            'Les plus tendances',
            style: TextStyle(
              fontFamily: 'GlovoBlack',
              fontSize: 20,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Constamment en tête des tendances, semaine après semaine, disponibles maintenant',
            style: TextStyle(
              fontFamily: 'GlovoBook',
              fontSize: 13,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          // Horizontal Trending Grid (2 columns of 3)
          SizedBox(
            height: 280, // Increased height for larger cards
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              children: [
                // Column 1: Items 1-3
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: [
                      Expanded(
                        child: _trendingItem(
                          1,
                          AppAssets.tacothLogo,
                          'Tacoth',
                          '92%',
                          4,
                          'Bs',
                        ),
                      ),
                      Expanded(
                        child: _trendingItem(
                          2,
                          AppAssets.restaurantOmmi,
                          'Restaurant O...',
                          '90%',
                          5,
                          'Bz',
                        ),
                      ),
                      Expanded(
                        child: _trendingItem(
                          3,
                          AppAssets.hoboLogo,
                          'Hobo',
                          '88%',
                          4,
                          'Hot',
                        ),
                      ),
                    ],
                  ),
                ),
                // Column 2: Items 4-6
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: [
                      Expanded(
                        child: _trendingItem(
                          4,
                          AppAssets.baguetteLogo,
                          'Baguette & B...',
                          '94%',
                          5,
                          'New',
                        ),
                      ),
                      Expanded(
                        child: _trendingItem(
                          5,
                          AppAssets.kfcLogo,
                          'KFC',
                          '85%',
                          3,
                          'Fast',
                        ),
                      ),
                      Expanded(
                        child: _trendingItem(
                          6,
                          AppAssets.jusZouhair,
                          'Jus Zouhair',
                          '91%',
                          4,
                          'Fresh',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _trendingItem(
    int rank,
    String logo,
    String name,
    String rating,
    int score,
    String badge,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12, right: 18),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 4),
          Text(
            '$rank',
            style: const TextStyle(
              fontFamily: 'GlovoBlack',
              fontSize: 22,
              color: Color(0xFF1B1B1B),
            ),
          ),
          const SizedBox(width: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              logo,
              width: 52,
              height: 52,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                width: 52,
                height: 52,
                color: Colors.grey[100],
                child: const Icon(Icons.store, size: 24, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontFamily: 'GlovoBold',
                    fontSize: 17,
                    color: Color(0xFF1B1B1B),
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.thumb_up_alt_outlined,
                      size: 14,
                      color: Color(0xFF6B6B6B),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: const TextStyle(
                        fontFamily: 'GlovoMedium',
                        fontSize: 13,
                        color: Color(0xFF6B6B6B),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoritesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Vos favoris courses',
                style: TextStyle(fontFamily: 'GlovoBlack', fontSize: 20),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[600]),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Les plus choisis dans votre ville',
            style: TextStyle(
              fontFamily: 'GlovoBook',
              fontSize: 13,
              color: Colors.grey[600],
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 165,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              _favoriteStore(AppAssets.carrefourMarket, 'Gratuit', true),
              _favoriteStore(AppAssets.carrefourExpress, 'Gratuit', true),
              _favoriteStore(AppAssets.myKiosk, 'Gratuit', false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _favoriteStore(String logo, String fee, bool hasBadge) {
    return Container(
      width: 110,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFF0F0F0)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    logo,
                    fit: BoxFit.contain,
                    errorBuilder: (_, _, _) =>
                        const Icon(Icons.store, size: 32),
                  ),
                ),
              ),
              if (hasBadge)
                Positioned(
                  top: -6,
                  right: -6,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB3E5FC),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.home,
                      size: 18,
                      color: Color(0xFF1B1B1B),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primaryYellow,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.delivery_dining,
                  size: 14,
                  color: Color(0xFF1B1B1B),
                ),
                const SizedBox(width: 3),
                Flexible(
                  child: Text(
                    fee,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'GlovoBold',
                      fontSize: 13,
                      color: Color(0xFF1B1B1B),
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

  Widget _buildAvailableSection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    'Disponibles sur Glovo',
                    style: TextStyle(fontFamily: 'GlovoBlack', fontSize: 20),
                  ),
                  const SizedBox(width: 6),
                  Icon(Icons.info_outline, size: 16, color: Colors.grey[400]),
                ],
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[600]),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'La meilleure façon de commander dans ces restaurants',
            style: TextStyle(
              fontFamily: 'GlovoBook',
              fontSize: 13,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          StoreCard(
            imagePath: AppAssets.baguettePack1,
            name: 'Baguette & Baguette',
            rating: '96%',
            deliveryTime: '15-25 min',
            deliveryFee: 'Gratuit',
            images: [
              AppAssets.baguettePack1,
              AppAssets.baguettePack2,
              AppAssets.baguettePack3,
            ],
            discount: '-30% sélection',
          ),
        ],
      ),
    );
  }
}
