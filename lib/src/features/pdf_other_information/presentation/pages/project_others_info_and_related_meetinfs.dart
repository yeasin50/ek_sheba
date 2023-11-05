import 'package:collection/collection.dart';
import 'package:ek_sheba/src/common/widgets/app_dialog.dart';
import 'package:fpdart/fpdart.dart';
import 'package:my_utils/my_utils.dart';

import '../../domain/entities/pdf_other_info_model.dart';
import '../widgets/project_header_tile.dart';
import '../widgets/project_others_header.dart';
import '../../../../locator.dart';
import 'package:flutter/material.dart';

import '../../../IDSDP/domain/entities/project_details.dart';
import '../../data/repositories/pdf_other_inforomation_impl.dart';

///* fetch and load other information and related meeting attachments
///
class ProjectOtherInformation extends StatelessWidget {
  const ProjectOtherInformation({
    Key? key,
    required this.projectDetails,
  }) : super(key: key);

  final ProjectDetails projectDetails;

  @override
  Widget build(BuildContext context) {
    late final _relatedMeetingAttachments =
        locator.get<PdfOtherInfoImpl>().getPdfRelatedMeetingAttachments(projectMovementStageId: "${projectDetails.projectMovementStageId}");

    late final _otherInformation = locator
        .get<PdfOtherInfoImpl>()
        .otherInfo(id: "${projectDetails.id}", projectType: projectDetails.projectType.nameEn);

    return Column(
      children: [
        ProjectOtherInfoHeader(type: ProjectOtherInfoType.relatedMeetingAttachments, isBN: projectDetails.isForeignAid),
        _ExtraPdfLoader(
          key: ValueKey('relatedMeetingAttachments'),
          future: _relatedMeetingAttachments,
        ),
        const SizedBox(height: 16),
        ProjectOtherInfoHeader(type: ProjectOtherInfoType.otherInformation, isBN: projectDetails.isForeignAid),
        _ExtraPdfLoader(
          key: ValueKey('otherInformation'),
          future: _otherInformation,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _ExtraPdfLoader extends StatelessWidget {
  const _ExtraPdfLoader({
    Key? key,
    required this.future,
  }) : super(key: key);

  final Future<Either<Failure, List<PdfOtherInfoModel>>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: defaultLoadingIndication);
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final isRight = snapshot.data?.isRight();
        if (isRight == null || !isRight) {
          return Center(child: Text('Error: ${snapshot.data?.asLeft().message}'));
        }

        final items = snapshot.data!.asRight();
        if (items.isEmpty) {
          return Center(child: Text('No data found'));
        }
        return Column(
          children: items
              .mapIndexed(
                (i, e) => ProjectOtherAttachmentTile(
                  title: e.title ?? '',
                  index: i + 1,
                  onTap: () {},
                ),
              )
              .toList(),
        );
      },
    );
  }
}
