import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_assets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    _buildFeaturedBrands(),
                    const SizedBox(height: 12),
                    _buildSamePrice(),
                    const SizedBox(height: 32),
                    _buildPopularSearches(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 20, 0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF1A1A1A)),
            onPressed: () => Navigator.pop(context),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey[500], size: 20),
                  const SizedBox(width: 10),
                  Text(
                    'Recherche',
                    style: TextStyle(
                      fontFamily: 'GlovoBook',
                      fontSize: 15,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedBrands() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Les marques vedettes',
          style: TextStyle(
            fontFamily: 'GlovoBlack',
            fontSize: 20,
            color: Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 16),
        // Brand grid - row 1
        Row(
          children: [
            _brandItem(AppAssets.baguetteLogo, 'Gratuit'),
            _brandItem(AppAssets.tacothLogo, 'Gratuit'),
            _brandItem(AppAssets.hoboLogo, 'Gratuit'),
          ],
        ),
        const SizedBox(height: 12),
        // Brand grid - row 2
        Row(
          children: [
            _brandItem(AppAssets.kfcLogo, 'Gratuit'),
            _brandItem(AppAssets.bonbonniere, 'Gratuit'),
            _brandItem(AppAssets.carrefourMarket, 'Gratuit'),
          ],
        ),
      ],
    );
  }

  Widget _brandItem(String logo, String fee) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderLight),
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  logo,
                  fit: BoxFit.contain,
                  errorBuilder: (_, _, _) => const Icon(Icons.store, size: 28, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.delivery_dining, size: 14, color: AppColors.primaryTeal),
                const SizedBox(width: 4),
                Text(
                  fee,
                  style: const TextStyle(
                    fontFamily: 'GlovoMedium',
                    fontSize: 12,
                    color: AppColors.primaryTeal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSamePrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.storefront, size: 16, color: AppColors.primaryTeal),
        const SizedBox(width: 6),
        Text(
          'Mêmes prix qu\'en magasin',
          style: TextStyle(
            fontFamily: 'GlovoMedium',
            fontSize: 13,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(width: 4),
        Icon(Icons.info_outline, size: 14, color: Colors.grey[400]),
      ],
    );
  }

  Widget _buildPopularSearches() {
    final searches = [
      'kfc', 'pizza', 'burger', 'chilis', 'hobo',
      'monoprix', 'iftar', 'tacos', 'makloub',
      'baguette et baguette',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recherches populaires',
          style: TextStyle(
            fontFamily: 'GlovoBlack',
            fontSize: 20,
            color: Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 10,
          children: searches.map((search) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                search,
                style: const TextStyle(
                  fontFamily: 'GlovoMedium',
                  fontSize: 14,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
