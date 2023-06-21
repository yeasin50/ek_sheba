import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../common/app_style.dart';

class MinimalAppBar extends StatelessWidget {
  
  const MinimalAppBar({
    super.key,
    required this.title,
    this.onBackButtonPressed,
  });

  final String title;
  final VoidCallback? onBackButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kTextTabBarHeight,
      width: double.infinity,
      decoration: AppStyle.appBarDecoration,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: onBackButtonPressed,
            child: const Icon(
              Icons.arrow_back,
              color: AppStyle.textBlack,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title.tr(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}
