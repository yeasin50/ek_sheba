import '../../data/datasources/home_button_datasource.dart';
import '../../data/models/button_info.dart';
import '../widgets/idsdp_card.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:go_router/go_router.dart';
import '../../../../common/widgets/background.dart';
import '../../../../common/widgets/custom_appbar.dart';

//home page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void onCardTap(ButtonInfo e, int i) {
      if (i == 0) {
        context.push('/dashboard', extra: {
          'itemTitle': e.title,
        });
      }
    }

    return BackgroundDecoration(
      hasDrawer: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const IDSDPAppBar(hasDrawer: true),
            const SizedBox(height: 40),
            ...homeButtons
                .mapIndexed(
                  (i, e) => IDSDPCard(
                    buttonInfo: e,
                    onTap: () => onCardTap(e, i),
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
