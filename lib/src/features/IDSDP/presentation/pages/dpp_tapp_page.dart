import 'package:flutter/material.dart';

import '../../../../common/utils/logger.dart';
import '../../../../common/widgets/background.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../domain/entities/project_details.dart';
import '../utils/on_project_search.dart';
import '../widgets/criteria_based_search.dart';
import '../widgets/project_list_build.dart';

class DPPTAPPPage extends StatefulWidget {
  const DPPTAPPPage({super.key});
  static const String routeName = '/dpp_tapp';

  @override
  State<DPPTAPPPage> createState() => _DPPTAPPPageState();
}

class _DPPTAPPPageState extends State<DPPTAPPPage> {
  List<ProjectDetails> projectsInfo = [];

  int page = 1;
  String? projectName;
  String? status;
  int? sectorId;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    searchProject().then((value) {
      setState(() {
        projectsInfo.addAll(value);
        isLoading = false;
      });
    }).catchError((e) {
      logger.e(e);
    });
    _scrollController.addListener(scrollListener);
  }

  final ScrollController _scrollController = ScrollController();

  void scrollListener() {
    //load more on before 100 px
    if (_scrollController.hasClients && _scrollController.offset > _scrollController.position.maxScrollExtent - 100) {
      loadMore();
    }
  }

  Future<void> loadMore() async {
    logger.d('load more called');
    page++;

    setState(() {
      isLoading = true;
    });

    final result = await searchProject(
      projectName: projectName,
      sectorId: sectorId,
      status: status,
      page: page,
    );

    setState(() {
      isLoading = false;
      projectsInfo.addAll(result);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundDecoration(
      hasDrawer: true,
      body: Column(
        children: [
          const IDSDPAppBar(
            hasDrawer: true,
            hasHomeButton: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              child: Column(
                children: [
                  CriteriaBasedSearch(
                    onSearch: (value, sectorId, status) {
                      projectsInfo.clear();
                      page = 1;
                      isLoading = true;
                      projectName = value;
                      this.sectorId = sectorId;
                      this.status = status;
                      setState(() {});

                      searchProject(
                        projectName: value,
                        sectorId: sectorId,
                        status: status,
                      ).then((value) {
                        setState(() {
                          projectsInfo.addAll(value);
                          isLoading = false;
                        });
                      }).catchError((e) {
                        logger.e(e);
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  ProjectListBuild(
                    projectDetails: projectsInfo,
                  )
                ],
              ),
            ),
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
