import 'package:bunny_sync/global/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.toolbarHeight = kToolbarHeight,
    this.automaticallyImplyLeading = true,
    this.leadingWith = 56,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
    this.backgroundColor,
  });

  final double toolbarHeight;
  final bool automaticallyImplyLeading;
  final double leadingWith;
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final List<Widget>? actions;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: context.cs.surface,
        statusBarIconBrightness: Brightness.dark,
      ),
      elevation: 2,
      scrolledUnderElevation: 4,
      shadowColor: context.cs.shadow,
      title: title,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: leading,
      leadingWidth: leadingWith,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      actions: [
        ...?actions,
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
