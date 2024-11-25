import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/style/color_manager.dart';
import 'animated_loading_widget.dart';

class TameeniLoaderIndicator extends StatefulWidget {
  final Widget child;
  final AsyncCallback onRefresh;

  const TameeniLoaderIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  @override
  State<TameeniLoaderIndicator> createState() => _TameeniLoaderIndicatorState();
}

class _TameeniLoaderIndicatorState extends State<TameeniLoaderIndicator>
    with SingleTickerProviderStateMixin {
  ScrollDirection prevScrollDirection = ScrollDirection.idle;
  static const double _indicatorSize = 50;
  late final AnimationController _controller;
  static const Duration dur = Duration(milliseconds: 600);

  final _widgetController = IndicatorController();

  @override
  void initState() {
    _controller = AnimationController(
      duration: dur,
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      controller: _widgetController,
      offsetToArmed: _indicatorSize,
      onRefresh: widget.onRefresh,
      autoRebuild: false,
      child: widget.child,
      onStateChanged: (change) {
        if (change.didChange(to: IndicatorState.loading)) {
          _controller.repeat(reverse: true);
        } else if (change.didChange(from: IndicatorState.loading)) {
          _controller.stop();
        } else if (change.didChange(to: IndicatorState.idle)) {
          _controller.value = 0;
        }
      },
      builder: (
        BuildContext context,
        Widget child,
        IndicatorController controller,
      ) {
        return Stack(
          children: <Widget>[
            AnimatedBuilder(
              builder: (context, _) {
                return Transform.translate(
                  offset: Offset(0.0, controller.value * _indicatorSize),
                  child: child,
                );
              },
              animation: controller,
            ),
            AnimatedOpacity(
              duration: dur,
              opacity: controller.state == IndicatorState.idle ||
                      controller.state == IndicatorState.complete ||
                      controller.state == IndicatorState.finalizing ||
                      controller.state == IndicatorState.settling
                  ? 0
                  : controller.value > .2
                      ? 1
                      : controller.value,
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.basicsWhite.withOpacity(.3),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(12),
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (BuildContext context, Widget? _) {
                    return SizedBox(
                      height: .1.sh,
                      width: 1.sw,
                      child: const LoadingAnimation(),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
