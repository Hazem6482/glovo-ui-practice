import 'package:flutter/material.dart';

import '../constants/app_text_styles.dart';

class AddressBar extends StatelessWidget {
  final String address;
  final VoidCallback? onTap;

  const AddressBar({
    super.key,
    this.address = 'Av... 20 Mars 1956, 148',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFFFDD7E),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/map/apatement.webp',
              width: 16,
              height: 16,
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                address,
                style: AppTextStyles.addressBar.copyWith(
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.keyboard_arrow_down,
              color: Color(0xFF1A1A1A),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
