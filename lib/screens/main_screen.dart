import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import 'home_screen.dart';
import 'explorer_screen.dart';
import 'orders_screen.dart';
import 'account_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ExplorerScreen(),
    OrdersScreen(),
    AccountScreen(),
  ];

  Widget _buildIcon(String bgAsset, String fgAsset, bool isSelected) {
    return SizedBox(
      width: 42,
      height: 38,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          if (isSelected)
            Positioned(
              top: 4,
              child: SvgPicture.asset(
                AppAssets.ongoingAnimationBackgroundLightYellow,
                height: 30,
                fit: BoxFit.contain,
              ),
            ),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  bgAsset,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    isSelected ? AppColors.primaryYellow : Colors.transparent,
                    BlendMode.srcIn,
                  ),
                ),
                SvgPicture.asset(
                  fgAsset,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    isSelected ? Colors.black : AppColors.textMuted,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (index) => setState(() => _currentIndex = index),
                elevation: 0,
                backgroundColor: Colors.white,
                selectedItemColor: AppColors.textPrimary,
                unselectedItemColor: AppColors.textMuted,
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: const TextStyle(
                  fontFamily: 'GlovoMedium',
                  fontSize: 11,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontFamily: 'GlovoMedium',
                  fontSize: 11,
                ),
                items: [
                  BottomNavigationBarItem(
                    icon: _buildIcon(
                      AppAssets.icHouseBackground,
                      AppAssets.icHouseForeground,
                      false,
                    ),
                    activeIcon: _buildIcon(
                      AppAssets.icHouseBackground,
                      AppAssets.icHouseForeground,
                      true,
                    ),
                    label: 'Accueil',
                  ),
                  BottomNavigationBarItem(
                    icon: _buildIcon(
                      AppAssets.icMagnifyingGlassBackground,
                      AppAssets.icMagnifyingGlassForeground,
                      false,
                    ),
                    activeIcon: _buildIcon(
                      AppAssets.icMagnifyingGlassBackground,
                      AppAssets.icMagnifyingGlassForeground,
                      true,
                    ),
                    label: 'Explorer',
                  ),
                  BottomNavigationBarItem(
                    icon: _buildIcon(
                      AppAssets.icBagBackground,
                      AppAssets.icBagForeground,
                      false,
                    ),
                    activeIcon: _buildIcon(
                      AppAssets.icBagBackground,
                      AppAssets.icBagForeground,
                      true,
                    ),
                    label: 'Commandes',
                  ),
                  BottomNavigationBarItem(
                    icon: _buildIcon(
                      AppAssets.icPersonBackground,
                      AppAssets.icPersonForeground,
                      false,
                    ),
                    activeIcon: _buildIcon(
                      AppAssets.icPersonBackground,
                      AppAssets.icPersonForeground,
                      true,
                    ),
                    label: 'Compte',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
