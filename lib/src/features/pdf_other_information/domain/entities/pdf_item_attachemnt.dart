import 'dart:convert';

import 'package:equatable/equatable.dart';

class PdfItemAttachment extends Equatable {
  final int id;
  final String uuid;
  final bool? isDeleted;
  final String? createdBy;
  final String? createdOn;
  final String? updatedBy;
  final String? updatedOn;
  final String? name;
  final String? fileType;
  final String? fileName;
  final String? urlPath;
  final String? description;

  PdfItemAttachment({
    required this.id,
    required this.uuid,
    this.isDeleted,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
    this.name,
    this.fileType,
    this.fileName,
    this.urlPath,
    this.description,
  });

  @override
  List<Object?> get props => [
        id,
        uuid,
        isDeleted,
        createdBy,
        createdOn,
        updatedBy,
        updatedOn,
        name,
        fileType,
        fileName,
        urlPath,
        description,
      ];

  PdfItemAttachment copyWith({
    int? id,
    String? uuid,
    bool? isDeleted,
    String? createdBy,
    String? createdOn,
    String? updatedBy,
    String? updatedOn,
    String? name,
    String? fileType,
    String? fileName,
    String? urlPath,
    String? description,
  }) {
    return PdfItemAttachment(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      isDeleted: isDeleted ?? this.isDeleted,
      createdBy: createdBy ?? this.createdBy,
      createdOn: createdOn ?? this.createdOn,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedOn: updatedOn ?? this.updatedOn,
      name: name ?? this.name,
      fileType: fileType ?? this.fileType,
      fileName: fileName ?? this.fileName,
      urlPath: urlPath ?? this.urlPath,
      description: description ?? this.description,
    );
  }

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
    if (name != null) {
      result.addAll({'name': name});
    }
    if (fileType != null) {
      result.addAll({'fileType': fileType});
    }
    if (fileName != null) {
      result.addAll({'fileName': fileName});
    }
    if (urlPath != null) {
      result.addAll({'urlPath': urlPath});
    }
    if (description != null) {
      result.addAll({'description': description});
    }

    return result;
  }

  factory PdfItemAttachment.fromMap(Map<String, dynamic> map) {
    return PdfItemAttachment(
      id: map['id']?.toInt() ?? 0,
      uuid: map['uuid'] ?? '',
      isDeleted: map['isDeleted'],
      createdBy: map['createdBy'],
      createdOn: map['createdOn'],
      updatedBy: map['updatedBy'],
      updatedOn: map['updatedOn'],
      name: map['name'],
      fileType: map['fileType'],
      fileName: map['fileName'],
      urlPath: map['urlPath'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PdfItemAttachment.fromJson(String source) => PdfItemAttachment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PdfItemAttachment(id: $id, uuid: $uuid, isDeleted: $isDeleted, createdBy: $createdBy, createdOn: $createdOn, updatedBy: $updatedBy, updatedOn: $updatedOn, name: $name, fileType: $fileType, fileName: $fileName, urlPath: $urlPath, description: $description)';
  }
}
