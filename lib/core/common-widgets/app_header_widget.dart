import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../get_it_injection.dart';
import '../utils/navigation_routes/navigation_utils.dart';
import '../utils/style/asset_manager.dart';
import '../utils/style/text_manager.dart';
import 'images/image_widget.dart';
import 'text_widget.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final bool canPop;
  final bool showSupportIcon;
  final String? title;
  final Widget? secondAction;
  final void Function()? onBackPressed;
  final void Function()? onClickLogo;

  const AppHeader({
    this.canPop = true,
    this.title,
    super.key,
    this.onBackPressed,
    this.secondAction,
    this.showSupportIcon = true,
    this.onClickLogo,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      centerTitle: true,
      leadingWidth: 70,
      leading: canPop
          ? IconButton(
              padding: const EdgeInsetsDirectional.only(start: 24, end: 24),
              icon: Transform.rotate(
                angle: context.locale.languageCode == 'ar' ? 3.14 : 0,
                child: const ImageWidget(
                  imageUrl: IconsAssets.arrowLeft,
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ),
              onPressed: onBackPressed ??
                  () {
                    Navigator.pop(context);
                  },
            )
          : GestureDetector(
              onTap: onClickLogo ??
                  () {
                    _handleLogoOnTap(context);
                  },
              child: const Center(
                child: ImageWidget(
                  imageUrl: IconsAssets.newTameeniLogo,
                  width: 35,
                  height: 35,
                  fit: BoxFit.cover,
                ),
              ),
            ),
      actions: [
        if (secondAction != null) secondAction!,
        if (showSupportIcon)
          GestureDetector(
            onTap: () {
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                child: Center(
                  child: ImageWidget(
                    imageUrl: IconsAssets.headphonesSupport,
                    fit: BoxFit.cover,
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
            ),
          ),
      ],
      title: TextWidget(
        title: title ?? '',
        style: TextStyleManager.medium16Medium,
      ),
    );
  }

  void _handleLogoOnTap(BuildContext context) {
  }

  @override
  Size get preferredSize => Size(1.sw, 60.h);
}
