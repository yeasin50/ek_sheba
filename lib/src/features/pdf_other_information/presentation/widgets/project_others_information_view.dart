import 'package:collection/collection.dart';
import 'package:fpdart/fpdart.dart' show Either;

import '../../../../common/utils/logger.dart';
import '../../../../common/widgets/app_button.dart';
import '../../../../common/widgets/app_dialog.dart';
import '../../domain/entities/pdf_other_info_model.dart';
import 'package:flutter/material.dart';

import '../../../../locator.dart';
import '../../data/repositories/pdf_other_inforomation_impl.dart';
import 'project_header_tile.dart';
import 'project_others_header.dart';

///* fetch and load other information  attachments on [ProjectDetails]
class ProjectOtherInformation extends StatefulWidget {
  ProjectOtherInformation({
    super.key,
    required this.id,
    required this.projectType,
    required this.isForeignAid,
  }) : assert(
          id.isNotEmpty && projectType.isNotEmpty,
          'id and projectType must not be empty',
        );

  final String id;
  final String projectType;
  final bool isForeignAid;

  @override
  State<ProjectOtherInformation> createState() => _ProjectOtherInformationState();
}

class _ProjectOtherInformationState extends State<ProjectOtherInformation> {
  List<PdfOtherInfoModel>? items;

  int currentPage = 0;
  int size = 5;
  bool isLoading = false;

  Future<Either<Failure, List<PdfOtherInfoModel>>> _getItems() async {
    logger.d('fetching other information $currentPage');
    final result = await locator.get<PdfOtherInfoImpl>().otherInfo(
          id: widget.id,
          projectType: widget.projectType,
          page: currentPage,
          size: size,
        );
    return result;
  }

  void _loadMore() async {
    setState(() {
      isLoading = true;
    });

    final result = await _getItems();

    result.fold(
      (l) {
        logger.e('error loading more items');
        setState(() {
          isLoading = false;
        });
      },
      (r) {
        logger.d('loaded items ${r.length}');
        setState(() {
          isLoading = false;
          items = [...items ?? [], ...r];
        });
      },
    );
    currentPage++;
  }

  @override
  void initState() {
    super.initState();
    _loadMore();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('otherInformation _other pdf Column'),
      children: items == null
          ? [
              Center(
                child: defaultLoadingIndication,
              )
            ]
          : [
              ProjectOtherInfoHeader(type: ProjectOtherInfoType.otherInformation, isBN: widget.isForeignAid),
              ...items!
                  .mapIndexed(
                    (i, e) => ProjectOtherAttachmentTile(
                      title: e.title ?? '',
                      index: i + 1,
                      onTap: () {},
                    ),
                  )
                  .toList(),
              if (items!.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text('No data found'),
                  ),
                )
              else if (isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else
                AppButton(
                  isFilled: false,
                  text: "Load more",
                  onPressed: _loadMore,
                ),
            ],
    );
  }
}
