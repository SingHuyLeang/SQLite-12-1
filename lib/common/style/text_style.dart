import 'package:flutter/material.dart';
import 'package:note_app/common/style/colors.dart';

class NText extends StatelessWidget {
  const NText({
    super.key,
    required this.text,
    this.size = 16,
    this.color = NColors.dark,
    this.weight,
    this.wrap,
    this.overflow,
    this.family = 'poppins-r'
  });
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final bool? wrap;
  final TextOverflow? overflow;
  final String family;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: family,
        fontSize: size,
        color: color,
        fontWeight: weight,
      ),
      softWrap: wrap,
      overflow: overflow,
    );
  }
}
