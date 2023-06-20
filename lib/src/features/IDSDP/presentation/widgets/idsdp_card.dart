import 'package:ek_sheba/src/common/app_style.dart';
import 'package:ek_sheba/src/features/IDSDP/data/models/button_info.dart';
import 'package:flutter/material.dart';

///used to hold the card for the IDSDP page, [HomePage]
class IDSDPCard extends StatelessWidget {
  const IDSDPCard({
    super.key,
    required this.buttonInfo,
    this.onTap,
  });

  final ButtonInfo buttonInfo;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.only(
      topLeft: Radius.circular(32),
      bottomRight: Radius.circular(32),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 9,
      ),
      child: Material(
        color: AppStyle.buttonGreen,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Image.asset(
                  buttonInfo.imagePath,
                  height: 32,
                  width: 32,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    buttonInfo.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
