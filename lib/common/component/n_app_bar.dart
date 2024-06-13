import 'package:flutter/material.dart';
import 'package:note_app/common/style/colors.dart';
import 'package:note_app/common/style/text_style.dart';

class NAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NAppBar({
    super.key,
    this.showBackArrow = false,
    required this.title,
    this.showBackgroud = true,
    this.center = true,
    this.actions,
  });

  final bool showBackArrow;
  final String title;
  final bool showBackgroud;
  final bool center;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: showBackArrow,
      backgroundColor: showBackgroud ? NColors.primary : null,
      centerTitle: center,
      title: NText(
        text: title,
        color: NColors.light,
        size: 22,
        weight: FontWeight.bold,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
