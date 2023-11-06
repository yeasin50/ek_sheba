import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'pdf_item_attachemnt.dart';
import 'project_movement_state.dart';

class PdfOtherInfoModel extends Equatable {
  const PdfOtherInfoModel({
    required this.id,
    required this.uuid,
    this.isDeleted,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
    this.rdppRtappMasterId,
    this.projectSummaryId,
    this.title,
    this.projectType,
    this.attachment,
    this.projectMovementState,
    this.paperType,
  });

  final int id;
  final String uuid;
  final bool? isDeleted;
  final String? createdBy;
  final String? createdOn;
  final String? updatedBy;
  final String? updatedOn;
  final String? rdppRtappMasterId;
  final int? projectSummaryId;
  final String? title;
  final String? projectType;
  final PdfItemAttachment? attachment;
  final ProjectMovementState? projectMovementState;

  final String? paperType;

  @override
  List<Object?> get props => [
        id,
        uuid,
        isDeleted,
        createdBy,
        createdOn,
        updatedBy,
        updatedOn,
        rdppRtappMasterId,
        projectSummaryId,
        title,
        projectType,
        attachment,
        projectMovementState,
        paperType,
      ];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'uuid': uuid});
    if (isDeleted != null) {
      result.addAll({'isDeleted': isDeleted});
    }
    if (createdBy != null) {
      result.addAll({'createdBy': createdBy});
    }
    if (createdOn != null) {
      result.addAll({'createdOn': createdOn});
    }
    if (updatedBy != null) {
      result.addAll({'updatedBy': updatedBy});
    }
    if (updatedOn != null) {
      result.addAll({'updatedOn': updatedOn});
    }
    if (rdppRtappMasterId != null) {
      result.addAll({'rdppRtappMasterId': rdppRtappMasterId});
    }
    if (projectSummaryId != null) {
      result.addAll({'projectSummaryId': projectSummaryId});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (projectType != null) {
      result.addAll({'projectType': projectType});
    }
    if (attachment != null) {
      result.addAll({'attachment': attachment!.toMap()});
    }
    if (projectMovementState != null) {
      result.addAll({'projectMovementState': projectMovementState!.toMap()});
    }
    if (paperType != null) {
      result.addAll({'paperType': paperType});
    }

    return result;
  }

  factory PdfOtherInfoModel.fromMap(Map<String, dynamic> map) {
    return PdfOtherInfoModel(
      id: map['id']?.toInt() ?? 0,
      uuid: map['uuid'] ?? '',
      isDeleted: map['isDeleted'],
      createdBy: map['createdBy'],
      createdOn: map['createdOn'],
      updatedBy: map['updatedBy'],
      updatedOn: map['updatedOn'],
      rdppRtappMasterId: map['rdppRtappMasterId'].toString(),
      projectSummaryId: int.tryParse("${map['projectSummaryId']}" ?? ""),
      title: map['title'],
      projectType: map['projectType'],
      attachment: map['attachment'] != null ? PdfItemAttachment.fromMap(map['attachment']) : null,
      projectMovementState:
          map['projectMovementState'] != null ? ProjectMovementState.fromMap(map['projectMovementState']) : null,
      paperType: map['paperType'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PdfOtherInfoModel.fromJson(String source) => PdfOtherInfoModel.fromMap(json.decode(source));
}
