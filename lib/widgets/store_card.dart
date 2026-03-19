import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class StoreCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String rating;
  final String deliveryTime;
  final String deliveryFee;
  final VoidCallback? onTap;
  final List<String>? images;
  final String? discount;

  const StoreCard({
    super.key,
    required this.imagePath,
    required this.name,
    this.rating = '96%',
    this.deliveryTime = '15-25 min',
    this.deliveryFee = 'Gratuit',
    this.onTap,
    this.images,
    this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image row
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: images != null && images!.isNotEmpty
                    ? Row(
                        children: images!.take(3).map((img) {
                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 2),
                              child: Image.asset(
                                img,
                                fit: BoxFit.cover,
                                height: 150,
                                errorBuilder: (_, _, _) => Container(
                                  color: Colors.grey[200],
                                  child: const Icon(Icons.restaurant),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      )
                    : Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => Container(
                              color: Colors.grey[200],
                              child: const Icon(Icons.restaurant, size: 48),
                            ),
                          ),
                          if (discount != null)
                            Positioned(
                              top: 12,
                              left: 12,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryYellow,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  discount!,
                                  style: const TextStyle(
                                    fontFamily: 'GlovoBold',
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
              ),
            ),
            // Info section
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.storefront, size: 16, color: AppColors.primaryTeal),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontFamily: 'GlovoBold',
                            fontSize: 16,
                            color: Color(0xFF1A1A1A),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(Icons.favorite_border, size: 20, color: Colors.grey),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.thumb_up_alt_outlined, size: 14, color: AppColors.primaryTeal),
                      const SizedBox(width: 4),
                      Text(
                        rating,
                        style: const TextStyle(fontFamily: 'GlovoMedium', fontSize: 12, color: Color(0xFF1A1A1A)),
                      ),
                      _dot(),
                      Text(
                        deliveryTime,
                        style: const TextStyle(fontFamily: 'GlovoBook', fontSize: 12, color: Color(0xFF6B6B6B)),
                      ),
                      _dot(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.primaryTeal.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.delivery_dining, size: 12, color: AppColors.primaryTeal),
                            const SizedBox(width: 2),
                            Text(
                              deliveryFee,
                              style: const TextStyle(fontFamily: 'GlovoMedium', fontSize: 11, color: AppColors.primaryTeal),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dot() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: Text('·', style: TextStyle(fontSize: 14, color: Color(0xFF9B9B9B))),
    );
  }
}
