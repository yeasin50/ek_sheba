import 'package:flutter/material.dart';

///used to hold the card for the IDSDP page, [HomePage]
class IDSDPCard extends StatelessWidget {
  const IDSDPCard({
    super.key,
    required this.title,
    required this.imagePath,
    this.onTap,
  });

  final String title;
  final String imagePath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
