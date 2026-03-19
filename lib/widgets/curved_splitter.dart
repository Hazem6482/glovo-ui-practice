import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_assets.dart';

class CurvedSplitter extends StatelessWidget {
  const CurvedSplitter({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAssets.homeCurve, // Assuming this is defined in AppAssets
      width: MediaQuery.sizeOf(context).width,
      fit: BoxFit.fitWidth,
    );
  }
}
