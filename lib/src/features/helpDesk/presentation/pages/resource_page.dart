import '../bloc/resource/resource_bloc.dart';
import '../../../../locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/background.dart';
import '../widgets/widgets.dart';

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({super.key});

  static const routeName = '/resource';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<ResourceBloc>()..add(ResourceActiveListRequested()),
      child: BackgroundDecoration(
        body: Column(
          children: [
            const MinimalAppBar(title: 'Resources'),
            const SizedBox(height: 40),
            const ResourceSelectorDropDown(),
            Builder(builder: (context) {
              return Expanded(
                child: BlocBuilder<ResourceBloc, ResourceState>(
                  builder: (context, state) {
                    if (state.resourceList.isEmpty) return const Center(child: Text("Empty List"));

                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 24,
                      ),
                      itemCount: state.resourceList.length,
                      itemBuilder: (context, index) {
                        return ResourceCard(resourceInfo: state.resourceList[index]);
                      },
                    );
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
