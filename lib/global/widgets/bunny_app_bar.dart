import 'package:flutter/material.dart';

class BunnyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BunnyAppBar({
    super.key,
    this.automaticallyImplyLeading = true,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions, this.onTap,
  });

  final VoidCallback? onTap;
  final bool automaticallyImplyLeading;
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: kToolbarHeight,
      title: title,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: leading,
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
