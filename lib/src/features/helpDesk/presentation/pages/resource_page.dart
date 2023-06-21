import 'package:flutter/cupertino.dart';

import '../../../../common/widgets/background.dart';
import '../../data/datasources/resource_temp_db.dart';
import '../widgets/resource_card.dart';
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
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 24,
              ),
              itemCount: tempResourcesData.length,
              itemBuilder: (context, index) {
                return ResourceCard(resourceInfo: tempResourcesData[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
