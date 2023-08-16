import 'dart:convert';

import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:equatable/equatable.dart';

class ProjectSubItemInfo extends Equatable {
  const ProjectSubItemInfo({
    required this.id,
    required this.uuid,
    required this.nameEn,
    required this.nameBn,
    required this.code,
  });

  final int id;

  final String uuid;
  final String nameEn;
  final String nameBn;
  final String code;

  @override
  List<Object?> get props => [id, uuid, nameEn, nameBn, code];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'uuid': uuid});
    result.addAll({'nameEn': nameEn});
    result.addAll({'nameBn': nameBn});
    result.addAll({'code': code});

    return result;
  }

  factory ProjectSubItemInfo.fromMap(Map<String, dynamic> map) {
    try {
      return ProjectSubItemInfo(
        id: map['id']?.toInt() ?? 0,
        uuid: map['uuid'] ?? '',
        nameEn: map['nameEn'] ?? '',
        nameBn: map['nameBn'] ?? '',
        code: map['code'] ?? '',
      );
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }

  String toJson() => json.encode(toMap());

  factory ProjectSubItemInfo.fromJson(String source) => ProjectSubItemInfo.fromMap(json.decode(source));

  ProjectSubItemInfo copyWith({
    int? id,
    String? uuid,
    String? nameEn,
    String? nameBn,
    String? code,
  }) {
    return ProjectSubItemInfo(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      nameEn: nameEn ?? this.nameEn,
      nameBn: nameBn ?? this.nameBn,
      code: code ?? this.code,
    );
  }

  @override
  String toString() {
    return 'ProjectSubItemInfo(id: $id, uuid: $uuid, nameEn: $nameEn, nameBn: $nameBn, code: $code)';
  }
}
