import 'package:flutter/cupertino.dart';

import '../../../../common/widgets/background.dart';
import '../widgets/widgets.dart';

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({super.key});

  static const routeName = '/resourcesPage';

  @override
  Widget build(BuildContext context) {
    return BackgroundDecoration(
      body: Column(
        children: [
          MinimalAppBar(
            title: 'Resources',
            onBackButtonPressed: () {},
          ),
          const SizedBox(height: 40),
          const ResourceSelectorDropDown(),
        ],
      ),
    );
  }
}
