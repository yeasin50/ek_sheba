import 'package:collection/collection.dart';
import 'package:go_router/go_router.dart';
import 'package:my_utils/my_utils.dart';
import '../../../../common/widgets/app_button.dart';
import '../../../../common/widgets/app_dialog.dart';
import '../../../pdf/presentation/pages/pdf_page.dart';
import '../../domain/entities/entities.dart';
import '../../domain/entities/pdf_other_info_model.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' as fpdart;
import '../../../../locator.dart';
import '../../data/repositories/pdf_other_inforomation_impl.dart';
import 'project_header_tile.dart';
import 'project_others_header.dart';

///* fetch and load other information and related meeting attachments on [ProjectDetails]
class ProjectRelatedMeetingView extends StatefulWidget {
  const ProjectRelatedMeetingView({
    Key? key,
    required this.projectMovementStageId,
    required this.isForeignAid,
  }) : super(key: key);

  final String projectMovementStageId;
  final bool isForeignAid;

  @override
  State<ProjectRelatedMeetingView> createState() => _ProjectRelatedMeetingViewState();
}

class _ProjectRelatedMeetingViewState extends State<ProjectRelatedMeetingView> {
  List<PdfOtherInfoModel>? items;

  int currentPage = 0;
  int size = 5;
  bool isLoading = false;
  bool isLastPage = false;

  Future<fpdart.Either<Failure, PaginatedProjectAttachments>> _getItems() async =>
      await locator.get<PdfOtherInfoImpl>().getPdfRelatedMeetingAttachments(
            projectMovementStageId: widget.projectMovementStageId,
            page: currentPage,
            size: size,
          );

  void _loadMore() async {
    final _newItems = await _getItems();
    _newItems.fold((l) => logger.e('error loading more items'), (r) {
      setState(() {
        isLastPage = r.isLast;
        items = [...items ?? [], ...r.content];
      });
      currentPage++;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadMore();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items == null
          ? [
              Center(
                child: defaultLoadingIndication,
              )
            ]
          : [
              ProjectOtherInfoHeader(type: ProjectOtherInfoType.relatedMeetingAttachments, isBN: widget.isForeignAid),
              ...items!
                  .mapIndexed(
                    (i, e) => ProjectOtherAttachmentTile(
                      title: e.title ?? '',
                      index: i + 1,
                      onTap: () {
                        final path = "https://gwtraining.plandiv.gov.bd/pps-dpp-tapp/${e.attachment?.urlPath}";
                        final title = e.title ?? 'Other attachment Pdf ';

                        context.push(
                          PDFPage.routeName,
                          extra: {
                            'path': path,
                            'title': title,
                            'isTokenRequired': true,
                          },
                        );
                      },
                    ),
                  )
                  .toList(),
              if (items!.isEmpty)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('No data found'),
                  ),
                )
              else if (isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else if (isLastPage == false)
                AppButton(
                  isFilled: false,
                  text: "Load more",
                  onPressed: _loadMore,
                )
            ],
    );
  }
}
