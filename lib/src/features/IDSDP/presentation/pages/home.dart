import 'package:ek_sheba/src/features/IDSDP/data/datasources/home_button_datasource.dart';
import 'package:ek_sheba/src/features/IDSDP/presentation/widgets/idsdp_card.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/background.dart';
import '../../../../common/widgets/custom_appbar.dart';

//home page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundDecoration(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const IDSDPAppBar(),
            const SizedBox(height: 40),
            ...homeButtons
                .map(
                  (e) => IDSDPCard(
                    buttonInfo: e,
                    onTap: () {},
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
