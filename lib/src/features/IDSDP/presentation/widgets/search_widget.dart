import 'package:ek_sheba/src/common/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/app_button.dart';

/// a searchbox with a button return search tapEvent
class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.onSearch,
  });

  final Function(String) onSearch;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Row(
      children: [
        Expanded(
            child: SizedBox(
          height: 40,
          child: CupertinoSearchTextField(
            controller: controller,
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: AppStyle.buttonGreen,
              size: 24,
            ),
            placeholder: 'what are you looking for?',
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: AppStyle.buttonGreen,
                width: 1,
              ),
            ),
          ),
        )),
        const SizedBox(width: 8),
        AppButton(
          text: 'Search',
          isFilled: true,
          onPressed: () {
            onSearch(controller.text);
          },
        ),
      ],
    );
  }
}
