import 'package:flutter/material.dart';

class ProgressItemCard extends StatelessWidget {
  const ProgressItemCard({
    super.key,
    required this.title,
    required this.count,
    required this.color,
    this.onPressed,
  });
  final String title;
  final int count;
  final Color color;

  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(title),
                  Text(
                    count.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
