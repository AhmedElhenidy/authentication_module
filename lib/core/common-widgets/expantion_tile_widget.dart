import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/style/color_manager.dart';

class ExpandableWidget extends StatelessWidget {
  const ExpandableWidget({
    super.key,
    required this.titleWidget,
    required this.children,
    this.color,
    this.initiallyExpanded = false,
  });

  final List<Widget> children;
  final Widget titleWidget;
  final Color? color;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 0),
          iconColor: ColorManager.primaryPrimary6,
          collapsedIconColor: ColorManager.primaryPrimary6,
          initiallyExpanded: initiallyExpanded,
          title: titleWidget,
          backgroundColor: color,
          collapsedBackgroundColor: color,
          children: children,
        ),
      ),
    );
  }
}
