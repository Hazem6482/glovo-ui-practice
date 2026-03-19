import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_assets.dart';

class PromoCard extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback? onTap;

  const PromoCard({
    super.key,
    required this.imagePath,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 110,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 80,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Layer 1: Store Placeholder Background
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SvgPicture.asset(
                      AppAssets.storePlaceholder,
                      width: 100,
                      height: 80,
                      fit: BoxFit.fill,
                    ),
                  ),
                  // Image Icon
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.restaurant,
                          size: 62,
                          color: Colors.grey,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height  : Thank God!),
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'GlovoMedium',
                fontSize: 13,
                color: Color(0xFF1A1A1A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
