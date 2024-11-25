import 'package:flutter/material.dart';
import '../../utils/style/asset_manager.dart';
import 'package:lottie/lottie.dart';

class LoadingAnimation extends StatelessWidget {
  final double? width;
  const LoadingAnimation({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: width,
        child:
            Lottie.asset(LottieAssets.shieldLoading, frameRate: FrameRate.max),
      ),
    );
  }
}
