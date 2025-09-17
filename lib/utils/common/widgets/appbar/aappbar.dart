import 'package:e_commerce_app/utils/devices/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AAppbar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
    this.backgroundColor, this.padding = const EdgeInsets.all(8.0),
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: AppBar(
        
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        toolbarHeight: AppDeviceUtility.getAppBarHeight(),
        leading: showBackArrow
            ? IconButton(
                icon: Icon(Iconsax.arrow_left),
                onPressed: () => Get.back(),
              )
            : leadingIcon != null
            ? IconButton(icon: Icon(leadingIcon), onPressed: leadingOnPressed)
            : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDeviceUtility.getAppBarHeight());
}
