import 'package:flutter/material.dart';

class NField extends StatelessWidget {
  const NField({
    super.key,
    this.w = double.infinity,
    this.h,
    required this.controller,
    required this.hint,
    required this.color,
    required this.size,
    this.lines = 1,
  });
  final TextEditingController controller;
  final double? h, w;
  final String hint;
  final Color color;
  final double size;
  final int lines;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      padding: const EdgeInsets.all(8),
      child: TextField(
        controller: controller,
        style: textStyle(color, size),
        minLines: lines,
        maxLines: null,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: textStyle(color, size),
        ),
      ),
    );
  }

  TextStyle textStyle(Color color, double size) {
    return TextStyle(
      fontFamily: 'poppins-r',
      color: color,
      fontSize: size,
    );
  }
}
