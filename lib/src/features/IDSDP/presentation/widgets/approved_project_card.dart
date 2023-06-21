import 'package:ek_sheba/src/common/app_style.dart';
import 'package:ek_sheba/src/common/widgets/app_button.dart';
import 'package:ek_sheba/src/features/IDSDP/presentation/widgets/progress_item_card.dart';
import 'package:flutter/material.dart';

import 'label_decorator.dart';

class ApprovedProjectCard extends StatelessWidget {
  const ApprovedProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    const label = Padding(
      padding: EdgeInsets.only(left: 7.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: LabelDecoratorWidget(
          text: 'Approved Project',
        ),
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        decoration: BoxDecoration(
          color: AppStyle.textWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.black.withOpacity(.3),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Transform.translate(
              offset: const Offset(0, -12),
              child: label,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                // ProgressItemCard(title: title, count: count, color: color)
              ],
            )
          ],
        ),
      ),
    );
  }
}
