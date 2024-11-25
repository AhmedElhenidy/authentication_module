import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common-widgets/images/image_widget.dart';
import '../../../../core/utils/style/asset_manager.dart';
import '../../../../core/utils/style/color_manager.dart';
import '../../../../core/utils/style/text_manager.dart';

class AccountCardWidget extends StatelessWidget {
  final void Function()? onTap;
  final String identityNumber;
  const AccountCardWidget({
    required this.onTap,
    required this.identityNumber,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.greyGrey1,
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ImageWidget(
              imageUrl: IconsAssets.person,
            ),
            8.verticalSpace,
            Text(
              identityNumber,
              style: TextStyleManager.medium12Medium,
            ),
          ],
        ),
      ),
    );
  }
}
