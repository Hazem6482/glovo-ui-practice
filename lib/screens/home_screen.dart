import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';
import '../constants/app_assets.dart';
import '../widgets/address_bar.dart';
import '../widgets/category_item.dart';
import '../widgets/promo_card.dart';
import 'restaurant_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgYellow,
      body: CustomScrollView(
        slivers: [
          // Address bar at top
          SliverToBoxAdapter(
            child: _buildTopSection(context),
          ),
          // Categories centered + white section pinned to bottom
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                // Categories centered in remaining yellow space
                Expanded(
                  child: Center(
                    child: _buildCategoriesGrid(context),
                  ),
                ),
                // White section pinned to bottom
                _buildWhiteSection(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 12,
        left: 20,
        right: 20,
        bottom: 16,
      ),
      child: const Center(child: AddressBar()),
    );
  }

  Widget _buildCategoriesGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Row 1: Restaurants, Courses
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CategoryItem(
                imagePath: AppAssets.restaurants,
                label: 'Restaurants',
                size: 90,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RestaurantScreen()),
                  );
                },
              ),
              const SizedBox(width: 16),
              CategoryItem(imagePath: AppAssets.courses, label: 'Courses', size: 90),
            ],
          ),
          const SizedBox(height: 16),
          // Row 2: Boutiques, Parapharmacies, Service Coursier
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CategoryItem(
                imagePath: AppAssets.boutiques,
                label: 'Boutiques',
                size: 80,
              ),
              const SizedBox(width: 8),
              CategoryItem(
                imagePath: AppAssets.parapharmacies,
                label: 'Parapharma\ncies & Beau...',
                size: 80,
                labelBottom: 11,
              ),
              const SizedBox(width: 8),
              CategoryItem(
                imagePath: AppAssets.serviceCoursier,
                label: 'Service\nCoursier',
                size: 80,
                labelBottom: 11,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWhiteSection(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.bgYellow,
          child: SvgPicture.asset(
            'assets/svgs/home_curve.svg',
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              // "Ceci est pour vous" heading
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Ceci est pour vous',
                      style: TextStyle(
                        fontFamily: 'GlovoBlack',
                        fontSize: 22,
                        color: Color(0xFF1A1A1A),
                        height: 1.2,
                      ),
                    ),
                    Icon(Icons.info_outline, size: 18, color: Colors.grey[600]),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Promo carousel
              SizedBox(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  children: const [
                    PromoCard(imagePath: AppAssets.ramadan, label: 'Ramadan'),
                    PromoCard(
                      imagePath: AppAssets.baguetteBaguette,
                      label: 'Baguette & ...',
                    ),
                    PromoCard(imagePath: AppAssets.echemi, label: 'Echemi'),
                    PromoCard(imagePath: AppAssets.kfc, label: 'Hobo Chick...'),
                  ],
                ),
              ),
              // Dots indicator
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [_dot(true), const SizedBox(width: 6), _dot(false)],
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ],
    );
  }

  Widget _dot(bool active) {
    return Container(
      width: active ? 8 : 6,
      height: active ? 8 : 6,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? const Color(0xFF1A1A1A) : Colors.grey[300],
      ),
    );
  }
}
