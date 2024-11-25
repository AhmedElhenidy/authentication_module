import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/style/asset_manager.dart';
import '../../utils/style/color_manager.dart';

class OldLoadingAnimation extends StatefulWidget {
  final double upperBound;
  const OldLoadingAnimation({super.key, this.upperBound = 0.7});

  @override
  State<OldLoadingAnimation> createState() => _OldLoadingAnimationState();
}

class _OldLoadingAnimationState extends State<OldLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final Duration dur = const Duration(milliseconds: 600);
  final double aspectRatio = .15;

  @override
  void initState() {
    _controller = AnimationController(
      duration: dur,
      lowerBound: .05,
      upperBound: widget.upperBound,
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    _controller.repeat(reverse: true);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * .2,
      width: size.width * .3,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            duration: dur,
            top: size.height * aspectRatio * _controller.value,
            width: size.width * aspectRatio,
            bottom: 0,
            child: SvgPicture.asset(
              IconsAssets.logoBottomHalf,
              colorFilter: const ColorFilter.mode(
                ColorManager.primaryPrimary6,
                BlendMode.srcIn,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: dur,
            top: 0,
            width: size.width * aspectRatio,
            bottom: size.height * aspectRatio * _controller.value,
            child: SvgPicture.asset(
              IconsAssets.logoTopHalf,
              colorFilter: const ColorFilter.mode(
                ColorManager.primaryPrimary6,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
