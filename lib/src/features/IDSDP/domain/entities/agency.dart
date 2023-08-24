import 'dart:convert';

/*
  "id": 713,
        "uuid": "10712a54-49da-bb15-7b5c5b4ca46b",
        "isDeleted": false,
        "createdBy": "admin@gmail.com",
        "createdOn": "2021-06-01",
        "updatedBy": "admin@gmail.com",
        "updatedOn": "2023-01-29",
        "ministryDivision": {
            "id": 10,
            "uuid": "d2662d09-faed-453d-ac7e-0d0a25b058aa",
            "isDeleted": false,
            "createdBy": "admin@gmail.com",
            "createdOn": "2021-11-21",
            "updatedBy": "admin@gmail.com",
            "updatedOn": "2022-02-02",
            "code": "137",
            "entryCode": "137",
            "nameEn": "Local Government Division",
            "nameBn": "স্থানীয় সরকার বিভাগ",
            "shortName": "স্থানীয় সরকার, পল্লী উন্নয়ন ও সমবায় মন্ত্রণালয়/ পল্লী উন্নয়ন ও সমবায় বিভাগ।",
            "description": "স্থানীয় সরকার, পল্লী উন্নয়ন ও সমবায় মন্ত্রণালয়/ পল্লী উন্নয়ন ও সমবায় বিভাগ।Local Government Division",
            "status": true
        },
        "code": "131012300",
        "entryCode": "131012300",
        "nameEn": "National Institute of Local Government",
        "nameBn": "জাতীয় স্থানীয় সরকার ইনস্টিটিউট",
        "fiscalYear": "2021-12-01",
        "ceilingAmount": 6.0E9,
        "shortName": "",
        "description": "",
        "status": true
*/
import 'package:equatable/equatable.dart';

import 'ministry_division.dart';

class Agency extends Equatable {
  const Agency({
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
    required this.ministryDivision,
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
  final MinistryDivision ministryDivision;

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
    result.addAll({'ministryDivision': ministryDivision.toMap()});

    return result;
  }

  factory Agency.fromMap(Map<String, dynamic> map) {
    return Agency(
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
      ministryDivision: MinistryDivision.fromMap(map['ministryDivision']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Agency.fromJson(String source) => Agency.fromMap(json.decode(source));

  Agency copyWith({
    int? id,
    String? uuid,
    bool? isDeleted,
    String? createdBy,
    String? createdOn,
    String? updatedBy,
    String? updatedOn,
    String? code,
    String? entryCode,
    String? nameEn,
    String? nameBn,
    String? shortName,
    String? description,
    bool? status,
    MinistryDivision? ministryDivision,
  }) {
    return Agency(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      isDeleted: isDeleted ?? this.isDeleted,
      createdBy: createdBy ?? this.createdBy,
      createdOn: createdOn ?? this.createdOn,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedOn: updatedOn ?? this.updatedOn,
      code: code ?? this.code,
      entryCode: entryCode ?? this.entryCode,
      nameEn: nameEn ?? this.nameEn,
      nameBn: nameBn ?? this.nameBn,
      shortName: shortName ?? this.shortName,
      description: description ?? this.description,
      status: status ?? this.status,
      ministryDivision: ministryDivision ?? this.ministryDivision,
    );
  }

  @override
  String toString() {
    return 'Agency(id: $id, uuid: $uuid, isDeleted: $isDeleted, createdBy: $createdBy, createdOn: $createdOn, updatedBy: $updatedBy, updatedOn: $updatedOn, code: $code, entryCode: $entryCode, nameEn: $nameEn, nameBn: $nameBn, shortName: $shortName, description: $description, status: $status, ministryDivision: $ministryDivision)';
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
        code,
        entryCode,
        nameEn,
        nameBn,
        shortName,
        description,
        status,
        ministryDivision
      ];
}
