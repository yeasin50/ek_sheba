import 'package:ek_sheba/src/common/app_style.dart';
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
            Padding(
              padding: EdgeInsets.only(
                left: 7.0,
                right: 7.0,
                bottom: 24,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ProgressItemCard(
                      onTap: () {},
                      title: "Total",
                      count: 26,
                      color: const Color(0xffE1F2FE),
                      textColor: const Color(0xff3B82F6),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: ProgressItemCard(
                      onTap: () {},
                      title: "On Going",
                      count: 4,
                      color: const Color(0xffFBE6FE),
                      textColor: const Color(0xff9333EA),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: ProgressItemCard(
                      onTap: () {},
                      title: "Completed",
                      count: 22,
                      color: const Color(0xffD9FBE8),
                      textColor: const Color(0xff0D9488),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
