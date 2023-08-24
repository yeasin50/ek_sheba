import 'dart:convert';

import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:ek_sheba/src/features/IDSDP/domain/entities/project_subitem.dart';

class ProjectDetails extends Equatable {
  const ProjectDetails({
    required this.id,
    required this.uuid,
    required this.titleEn,
    required this.titleBn,
    required this.commencementDate,
    required this.completionDate,
    required this.status,
    required this.totalAmount,
    required this.projectType,
    required this.sector,
    required this.sectorDivision,
    required this.agency,
    required this.ministryDivision,
    this.currentProjectMovementStage,
    this.subSector,
    this.projectStatusEn,
    this.projectStatusBn,
    this.projectStageEn,
    this.projectStageBn,
    this.showAssignedOfficer,
    this.assignedOfficer,
    this.nothiStatusEn,
    this.nothiStatusBn,
  });

  final int id;
  final String uuid;
  final String titleEn;
  final String titleBn;
  final String commencementDate;
  final String completionDate;

  final String status;
  final Decimal totalAmount;
  final ProjectSubItemInfo projectType;
  final ProjectSubItemInfo sector;
  final ProjectSubItemInfo sectorDivision;
  final ProjectSubItemInfo agency;
  final ProjectSubItemInfo ministryDivision;

  final String? currentProjectMovementStage;
  final ProjectSubItemInfo? subSector;
  final String? projectStatusEn;
  final String? projectStatusBn;
  final String? projectStageEn;
  final String? projectStageBn;
  final bool? showAssignedOfficer;
  final String? assignedOfficer;
  final String? nothiStatusEn;
  final String? nothiStatusBn;

  @override
  List<Object?> get props => [id, uuid, titleEn, titleBn, commencementDate, completionDate, status, totalAmount];

  @override
  String toString() {
    return 'ProjectDetails(id: $id, uuid: $uuid, titleEn: $titleEn, titleBn: $titleBn, commencementDate: $commencementDate, completionDate: $completionDate, status: $status, totalAmount: $totalAmount, projectType: $projectType, sector: $sector, sectorDivision: $sectorDivision, agency: $agency, ministryDivision: $ministryDivision, currentProjectMovementStage: $currentProjectMovementStage, subSector: $subSector, projectStatusEn: $projectStatusEn, projectStatusBn: $projectStatusBn, projectStageEn: $projectStageEn, projectStageBn: $projectStageBn, showAssignedOfficer: $showAssignedOfficer, assignedOfficer: $assignedOfficer, nothiStatusEn: $nothiStatusEn, nothiStatusBn: $nothiStatusBn)';
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'uuid': uuid});
    result.addAll({'titleEn': titleEn});
    result.addAll({'titleBn': titleBn});
    result.addAll({'commencementDate': commencementDate});
    result.addAll({'completionDate': completionDate});
    result.addAll({'status': status});
    result.addAll({'totalAmount': totalAmount.toDouble()});
    result.addAll({'projectType': projectType.toMap()});
    result.addAll({'sector': sector.toMap()});
    result.addAll({'sectorDivision': sectorDivision.toMap()});
    result.addAll({'agency': agency.toMap()});
    result.addAll({'ministryDivision': ministryDivision.toMap()});
    if (currentProjectMovementStage != null) {
      result.addAll({'currentProjectMovementStage': currentProjectMovementStage});
    }
    if (subSector != null) {
      result.addAll({'subSector': subSector!.toMap()});
    }
    if (projectStatusEn != null) {
      result.addAll({'projectStatusEn': projectStatusEn});
    }
    if (projectStatusBn != null) {
      result.addAll({'projectStatusBn': projectStatusBn});
    }
    if (projectStageEn != null) {
      result.addAll({'projectStageEn': projectStageEn});
    }
    if (projectStageBn != null) {
      result.addAll({'projectStageBn': projectStageBn});
    }
    if (showAssignedOfficer != null) {
      result.addAll({'showAssignedOfficer': showAssignedOfficer});
    }
    if (assignedOfficer != null) {
      result.addAll({'assignedOfficer': assignedOfficer});
    }
    if (nothiStatusEn != null) {
      result.addAll({'nothiStatusEn': nothiStatusEn});
    }
    if (nothiStatusBn != null) {
      result.addAll({'nothiStatusBn': nothiStatusBn});
    }

    return result;
  }

  factory ProjectDetails.fromMap(Map<String, dynamic> map) {
    return ProjectDetails(
      id: map['id']?.toInt() ?? 0,
      uuid: map['uuid'] ?? '',
      titleEn: map['titleEn'] ?? '',
      titleBn: map['titleBn'] ?? '',
      commencementDate: map['commencementDate'] ?? '',
      completionDate: map['completionDate'] ?? '',
      status: map['status'] ?? '',
      totalAmount: Decimal.tryParse("${map['totalAmount']}") ?? Decimal.zero,
      projectType: ProjectSubItemInfo.fromMap(map['projectType']),
      sector: ProjectSubItemInfo.fromMap(map['sector']),
      sectorDivision: ProjectSubItemInfo.fromMap(map['sectorDivision']),
      agency: ProjectSubItemInfo.fromMap(map['agency']),
      ministryDivision: ProjectSubItemInfo.fromMap(map['ministryDivision']),
      currentProjectMovementStage: map['currentProjectMovementStage'],
      subSector: map['subSector'] != null ? ProjectSubItemInfo.fromMap(map['subSector']) : null,
      projectStatusEn: map['projectStatusEn'],
      projectStatusBn: map['projectStatusBn'],
      projectStageEn: map['projectStageEn'],
      projectStageBn: map['projectStageBn'],
      showAssignedOfficer: map['showAssignedOfficer'],
      assignedOfficer: map['assignedOfficer'],
      nothiStatusEn: map['nothiStatusEn'],
      nothiStatusBn: map['nothiStatusBn'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectDetails.fromJson(String source) => ProjectDetails.fromMap(json.decode(source));

  ProjectDetails copyWith({
    int? id,
    String? uuid,
    String? titleEn,
    String? titleBn,
    String? commencementDate,
    String? completionDate,
    String? status,
    Decimal? totalAmount,
    ProjectSubItemInfo? projectType,
    ProjectSubItemInfo? sector,
    ProjectSubItemInfo? sectorDivision,
    ProjectSubItemInfo? agency,
    ProjectSubItemInfo? ministryDivision,
    String? currentProjectMovementStage,
    ProjectSubItemInfo? subSector,
    String? projectStatusEn,
    String? projectStatusBn,
    String? projectStageEn,
    String? projectStageBn,
    bool? showAssignedOfficer,
    String? assignedOfficer,
    String? nothiStatusEn,
    String? nothiStatusBn,
  }) {
    return ProjectDetails(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      titleEn: titleEn ?? this.titleEn,
      titleBn: titleBn ?? this.titleBn,
      commencementDate: commencementDate ?? this.commencementDate,
      completionDate: completionDate ?? this.completionDate,
      status: status ?? this.status,
      totalAmount: totalAmount ?? this.totalAmount,
      projectType: projectType ?? this.projectType,
      sector: sector ?? this.sector,
      sectorDivision: sectorDivision ?? this.sectorDivision,
      agency: agency ?? this.agency,
      ministryDivision: ministryDivision ?? this.ministryDivision,
      currentProjectMovementStage: currentProjectMovementStage ?? this.currentProjectMovementStage,
      subSector: subSector ?? this.subSector,
      projectStatusEn: projectStatusEn ?? this.projectStatusEn,
      projectStatusBn: projectStatusBn ?? this.projectStatusBn,
      projectStageEn: projectStageEn ?? this.projectStageEn,
      projectStageBn: projectStageBn ?? this.projectStageBn,
      showAssignedOfficer: showAssignedOfficer ?? this.showAssignedOfficer,
      assignedOfficer: assignedOfficer ?? this.assignedOfficer,
      nothiStatusEn: nothiStatusEn ?? this.nothiStatusEn,
      nothiStatusBn: nothiStatusBn ?? this.nothiStatusBn,
    );
  }
}
