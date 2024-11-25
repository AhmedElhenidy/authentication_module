import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularLoadingWidget extends StatelessWidget {
  final double? width;
  final double? height;
  const CircularLoadingWidget({this.height, this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 20.w,
      height: height ?? 20.w,
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
