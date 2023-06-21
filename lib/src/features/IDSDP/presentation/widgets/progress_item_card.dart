import 'package:ek_sheba/src/common/app_style.dart';
import 'package:flutter/material.dart';

class ProgressItemCard extends StatelessWidget {
  const ProgressItemCard({
    super.key,
    required this.title,
    required this.count,
    this.color,
    this.textColor,
    this.onTap,
  });
  final String title;
  final int count;
  //default color is white
  final Color? color;
  //default color is black
  final Color? textColor;

  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? AppStyle.textWhite,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  const SizedBox(height: 8),
                  Text(
                    count.toString().padLeft(2, '0'),
                    style: TextStyle(
                      color: textColor ?? AppStyle.textBlack,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
