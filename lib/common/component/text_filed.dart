import 'package:flutter/material.dart';
import 'package:note_app/common/style/colors.dart';

class NField extends StatelessWidget {
  const NField({
    super.key,
    this.w = double.infinity,
    this.h,
    required this.controller,
    required this.hint,
    this.color = NColors.dark,
    required this.size,
    this.lines = 1,
    this.border = false,
    this.onChanged,
  });
  final TextEditingController controller;
  final double? h, w;
  final String hint;
  final Color color;
  final double size;
  final bool border;
  final int lines;
  final Function(String)? onChanged;
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
        onChanged: onChanged,
        decoration: InputDecoration(
          border: !border? InputBorder.none : OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: NColors.grey),
          ),
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
