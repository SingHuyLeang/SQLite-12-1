import 'package:flutter/material.dart';

class NIcon extends StatelessWidget {
  const NIcon({
    super.key,
    required this.icon,
    this.even,
    this.w = 24,
    this.h = 24,
  });
  final String icon;
  final Function()? even;
  final double? w, h;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: even,
      child: Container(
        width: w,
        height: h,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(icon),
          ),
        ),
      ),
    );
  }
}
