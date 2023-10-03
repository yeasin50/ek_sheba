import 'dart:convert';

import 'package:equatable/equatable.dart';

class MinistryDivision extends Equatable {
  const MinistryDivision({
    required this.id,
    required this.uuid,
    required this.isDeleted,
    required this.createdBy,
    required this.createdOn,
    required this.updatedBy,
    required this.updatedOn,
    required this.code,
    required this.entryCode,
    required this.nameEn,
    required this.nameBn,
    required this.shortName,
    required this.description,
    required this.status,
  });

  final int id;
  final String uuid;
  final bool isDeleted;
  final String createdBy;
  final String createdOn;
  final String updatedBy;
  final String updatedOn;
  final String code;
  final String entryCode;
  final String nameEn;
  final String nameBn;
  final String shortName;
  final String description;
  final bool status;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'uuid': uuid});
    result.addAll({'isDeleted': isDeleted});
    result.addAll({'createdBy': createdBy});
    result.addAll({'createdOn': createdOn});
    result.addAll({'updatedBy': updatedBy});
    result.addAll({'updatedOn': updatedOn});
    result.addAll({'code': code});
    result.addAll({'entryCode': entryCode});
    result.addAll({'nameEn': nameEn});
    result.addAll({'nameBn': nameBn});
    result.addAll({'shortName': shortName});
    result.addAll({'description': description});
    result.addAll({'status': status});

    return result;
  }

  factory MinistryDivision.fromMap(Map<String, dynamic> map) {
    return MinistryDivision(
      id: map['id']?.toInt() ?? 0,
      uuid: map['uuid'] ?? '',
      isDeleted: map['isDeleted'] ?? false,
      createdBy: map['createdBy'] ?? '',
      createdOn: map['createdOn'] ?? '',
      updatedBy: map['updatedBy'] ?? '',
      updatedOn: map['updatedOn'] ?? '',
      code: map['code'] ?? '',
      entryCode: map['entryCode'] ?? '',
      nameEn: map['nameEn'] ?? '',
      nameBn: map['nameBn'] ?? '',
      shortName: map['shortName'] ?? '',
      description: map['description'] ?? '',
      status: map['status'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory MinistryDivision.fromJson(String source) =>
      MinistryDivision.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        id,
        uuid,
        isDeleted,
        createdBy,
        createdOn,
        updatedBy,
        updatedOn,
        code,
        entryCode,
        nameEn,
        nameBn,
        shortName,
        description,
        status
      ];

  @override
  String toString() {
    return 'MinistryDivision(id: $id, uuid: $uuid, isDeleted: $isDeleted, createdBy: $createdBy, createdOn: $createdOn, updatedBy: $updatedBy, updatedOn: $updatedOn, code: $code, entryCode: $entryCode, nameEn: $nameEn, nameBn: $nameBn, shortName: $shortName, description: $description, status: $status)';
  }
}
