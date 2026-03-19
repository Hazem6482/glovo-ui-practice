import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_assets.dart';

class WhiteCurvedSplitter extends StatelessWidget {
  const WhiteCurvedSplitter({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAssets.whiteCurve,
      width: MediaQuery.sizeOf(context).width,
      fit: BoxFit.fitWidth,
    );
  }
}
