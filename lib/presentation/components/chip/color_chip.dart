import 'package:flutter/material.dart';
import 'package:parking_time/presentation/resources/styles/shape.dart';

import '../../resources/styles/colors.dart';

class ColorChip extends StatelessWidget {
  const ColorChip({
    super.key,
    required this.title,
    required this.titleColor,
    required this.backgroundColor,
    this.prefix,
    this.suffix,
  });

  final String title;
  
  final Color titleColor;

  final Color backgroundColor;

  final Widget? prefix;

  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kTransparent,
      child: Container(
        height: 21,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: kAllRound13,
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            if (prefix != null) prefix!,
            if (prefix != null) const SizedBox(width: 4),
            Text(title, style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600, color: titleColor)),
            if (suffix != null) const SizedBox(width: 4),
            if (suffix != null) suffix!,
          ],
        ),
      ),
    );
  }
}
