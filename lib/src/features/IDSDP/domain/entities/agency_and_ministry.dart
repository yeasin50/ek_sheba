import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'agency.dart';

/// this is the main class will fetch the data from the api
class AgencyAndMinistryInfo extends Equatable {
  final int id;
  final String uuid;
  final bool isDeleted;
  final String createdBy;
  final String createdOn;
  final String? updatedBy;
  final String? updatedOn;
  final int userId;
  final Agency agency;
  // final MinistryDivision? ministryDivision;
  // final SectorDivision? sectorDivision;
  // final PlanningMinister? planningMinister;
  // final Ecnec? ecnec;
  final bool checked;

  const AgencyAndMinistryInfo({
    required this.id,
    required this.uuid,
    required this.isDeleted,
    required this.createdBy,
    required this.createdOn,
    this.updatedBy,
    this.updatedOn,
    required this.userId,
    required this.agency,
    required this.checked,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'uuid': uuid});
    result.addAll({'isDeleted': isDeleted});
    result.addAll({'createdBy': createdBy});
    result.addAll({'createdOn': createdOn});
    if (updatedBy != null) {
      result.addAll({'updatedBy': updatedBy});
    }
    if (updatedOn != null) {
      result.addAll({'updatedOn': updatedOn});
    }
    result.addAll({'userId': userId});
    result.addAll({'agency': agency.toMap()});
    result.addAll({'checked': checked});

    return result;
  }

  factory AgencyAndMinistryInfo.fromMap(Map<String, dynamic> map) {
    return AgencyAndMinistryInfo(
      id: map['id']?.toInt() ?? 0,
      uuid: map['uuid'] ?? '',
      isDeleted: map['isDeleted'] ?? false,
      createdBy: map['createdBy'] ?? '',
      createdOn: map['createdOn'] ?? '',
      updatedBy: map['updatedBy'],
      updatedOn: map['updatedOn'],
      userId: map['userId']?.toInt() ?? 0,
      agency: Agency.fromMap(map['agency']),
      checked: map['checked'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AgencyAndMinistryInfo.fromJson(String source) =>
      AgencyAndMinistryInfo.fromMap(json.decode(source));

  AgencyAndMinistryInfo copyWith({
    int? id,
    String? uuid,
    bool? isDeleted,
    String? createdBy,
    String? createdOn,
    String? updatedBy,
    String? updatedOn,
    int? userId,
    Agency? agency,
    bool? checked,
  }) {
    return AgencyAndMinistryInfo(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      isDeleted: isDeleted ?? this.isDeleted,
      createdBy: createdBy ?? this.createdBy,
      createdOn: createdOn ?? this.createdOn,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedOn: updatedOn ?? this.updatedOn,
      userId: userId ?? this.userId,
      agency: agency ?? this.agency,
      checked: checked ?? this.checked,
    );
  }

  @override
  String toString() {
    return 'AgencyAndMinistryInfo(id: $id, uuid: $uuid, isDeleted: $isDeleted, createdBy: $createdBy, createdOn: $createdOn, updatedBy: $updatedBy, updatedOn: $updatedOn, userId: $userId, agency: $agency, checked: $checked)';
  }

  @override
  List<Object?> get props => [
        id,
        uuid,
        isDeleted,
        createdBy,
        createdOn,
        updatedBy,
        updatedOn,
        userId,
        agency,
        checked,
      ];
}
