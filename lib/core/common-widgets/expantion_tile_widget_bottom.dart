import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/style/color_manager.dart';
import '../utils/style/text_manager.dart';

class ExpandableWidgetBottom extends StatefulWidget {
  const ExpandableWidgetBottom({
    super.key,
    required this.titleWidget,
    required this.children,
    this.color,
    this.initiallyExpanded = false,
    required this.textView,
    required this.textHide,
  });

  final List<Widget> children;
  final Widget titleWidget;
  final Color? color;
  final String textView;
  final String textHide;
  final bool initiallyExpanded;

  @override
  ExpandableWidgetBottomState createState() => ExpandableWidgetBottomState();
}

class ExpandableWidgetBottomState extends State<ExpandableWidgetBottom> {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        color: widget.color,
        child: Column(
          children: [
            widget.titleWidget,
            AnimatedCrossFade(
              firstChild: const SizedBox(),
              secondChild: Column(
                children: widget.children,
              ),
              crossFadeState: _isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 200),
            ),
            2.verticalSpace,
            InkWell(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Row(
                children: [
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: ColorManager.primaryPrimary6,
                  ),
                  Text(
                    _isExpanded ? widget.textHide : widget.textView,
                    style: TextStyleManager.bold10Bold
                        .copyWith(color: ColorManager.primaryPrimary6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
