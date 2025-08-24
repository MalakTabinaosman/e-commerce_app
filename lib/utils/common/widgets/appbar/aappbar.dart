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
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: AppBar(
        automaticallyImplyLeading: false,
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
