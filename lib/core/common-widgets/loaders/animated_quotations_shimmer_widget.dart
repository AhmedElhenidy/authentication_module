import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/style/asset_manager.dart';
import 'package:lottie/lottie.dart';

class QuotationsShimmerAnimatedWidget extends StatelessWidget {
  const QuotationsShimmerAnimatedWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: 0.9.sw,
        child: Lottie.asset(
          LottieAssets.shimmerEffect,
          frameRate: FrameRate.max,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
