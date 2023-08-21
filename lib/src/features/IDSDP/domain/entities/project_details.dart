import 'dart:convert';

import 'package:decimal/decimal.dart';
import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:equatable/equatable.dart';

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

  @override
  List<Object?> get props => [id, uuid, titleEn, titleBn, commencementDate, completionDate, status, totalAmount];

  @override
  String toString() {
    return 'ProjectDetails(id: $id, uuid: $uuid, titleEn: $titleEn, titleBn: $titleBn, commencementDate: $commencementDate, completionDate: $completionDate, status: $status, totalAmount: $totalAmount, projectType: $projectType, sector: $sector, sectorDivision: $sectorDivision, agency: $agency, ministryDivision: $ministryDivision)';
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

    return result;
  }

  factory ProjectDetails.fromMap(Map<dynamic, dynamic> map) {
    try {
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
      );
    } catch (e) {
      logger.e("ProjectDetails.fromMap: ${e.toString()}");
      rethrow;
    }
  }

  String toJson() => json.encode(toMap());

  factory ProjectDetails.fromJson(String source) => ProjectDetails.fromMap(json.decode(source));
}
