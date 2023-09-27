import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app_style.dart';

class MinimalAppBar extends StatelessWidget {
  const MinimalAppBar({
    super.key,
    required this.title,
    this.onBackButtonPressed,
    this.action,
  });

  final String title;
  final VoidCallback? onBackButtonPressed;

  final Widget? action;

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
            onTap: onBackButtonPressed ?? context.pop,
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
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(width: 48),
          if (action != null) action!,
        ],
      ),
    );
  }
}
