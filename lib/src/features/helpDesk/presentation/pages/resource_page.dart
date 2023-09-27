import 'package:ek_sheba/src/features/pdf/data/repositories/pdf_repo_impl.dart';
import 'package:go_router/go_router.dart';

import '../../../pdf/presentation/pages/pdf_page.dart';
import '../../data/repositories/resouce_repository_impl.dart';
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
      create: (context) => ResourceBloc(locator.get<ResourceRepositoryImpl>())..add(ResourceActiveListRequested()),
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
                        final element = state.resourceList[index];
                        final path = "https://gwtraining.plandiv.gov.bd/api/${element.attachmentUrl}";
                        return ResourceCard(
                          resourceInfo: state.resourceList[index],
                          onDownload: () async {
                            await PdfRepositoryImpl.directDownload(path, name: element.attachmentName ?? "file.pdf");
                          },
                          onView: () {
                            context.push(
                              PDFPage.routeName,
                              extra: {
                                'path': path,
                                'title': element.attachmentName ?? "file",
                                'isTokenRequired': false,
                              },
                            );
                          },
                        );
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
