import 'dart:convert';

import 'package:equatable/equatable.dart';

class GuideLineInfo extends Equatable {
  const GuideLineInfo({
    required this.id,
    required this.uuid,
    this.moduleName,
    this.moduleFullName,
    this.isDevelopmentModule,
    this.logoName,
    this.logoUrl,
    this.isActive,
    this.imsModuleId,
    this.imsModuleName,
    this.title,
    this.description,
    this.attachmentName,
    this.attachmentUrl,
  });

  final int id;
  final String uuid;
  final String? moduleName;
  final String? moduleFullName;
  final bool? isDevelopmentModule;
  final String? logoName;
  final String? logoUrl;
  final bool? isActive;

  //response on post/details
  final String? imsModuleId;
  final String? imsModuleName;
  final String? title;
  final String? description;
  final String? attachmentName;
  final String? attachmentUrl;

  @override
  List<Object?> get props => [
        id,
        uuid,
        moduleName,
        moduleFullName,
        isDevelopmentModule,
        logoName,
        logoUrl,
        isActive,
        imsModuleId,
        imsModuleName,
        title,
        description,
        attachmentName,
        attachmentUrl,
      ];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'uuid': uuid});
    if (moduleName != null) {
      result.addAll({'moduleName': moduleName});
    }
    if (moduleFullName != null) {
      result.addAll({'moduleFullName': moduleFullName});
    }
    if (isDevelopmentModule != null) {
      result.addAll({'isDevelopmentModule': isDevelopmentModule});
    }
    if (logoName != null) {
      result.addAll({'logoName': logoName});
    }
    if (logoUrl != null) {
      result.addAll({'logoUrl': logoUrl});
    }
    if (isActive != null) {
      result.addAll({'isActive': isActive});
    }
    if (imsModuleId != null) {
      result.addAll({'imsModuleId': imsModuleId});
    }
    if (imsModuleName != null) {
      result.addAll({'imsModuleName': imsModuleName});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (attachmentName != null) {
      result.addAll({'attachmentName': attachmentName});
    }
    if (attachmentUrl != null) {
      result.addAll({'attachmentUrl': attachmentUrl});
    }

    return result;
  }

  factory GuideLineInfo.fromMap(Map<String, dynamic> map) {
    return GuideLineInfo(
      id: map['id']?.toInt() ?? 0,
      uuid: map['uuid'] ?? '',
      moduleName: map['moduleName'],
      moduleFullName: map['moduleFullName'],
      isDevelopmentModule: map['isDevelopmentModule'],
      logoName: map['logoName'],
      logoUrl: map['logoUrl'],
      isActive: map['isActive'],
      imsModuleId: map['imsModuleId'],
      imsModuleName: map['imsModuleName'],
      title: map['title'],
      description: map['description'],
      attachmentName: map['attachmentName'],
      attachmentUrl: map['attachmentUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GuideLineInfo.fromJson(String source) => GuideLineInfo.fromMap(json.decode(source));

  GuideLineInfo copyWith({
    int? id,
    String? uuid,
    String? moduleName,
    String? moduleFullName,
    bool? isDevelopmentModule,
    String? logoName,
    String? logoUrl,
    bool? isActive,
    String? imsModuleId,
    String? imsModuleName,
    String? title,
    String? description,
    String? attachmentName,
    String? attachmentUrl,
  }) {
    return GuideLineInfo(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      moduleName: moduleName ?? this.moduleName,
      moduleFullName: moduleFullName ?? this.moduleFullName,
      isDevelopmentModule: isDevelopmentModule ?? this.isDevelopmentModule,
      logoName: logoName ?? this.logoName,
      logoUrl: logoUrl ?? this.logoUrl,
      isActive: isActive ?? this.isActive,
      imsModuleId: imsModuleId ?? this.imsModuleId,
      imsModuleName: imsModuleName ?? this.imsModuleName,
      title: title ?? this.title,
      description: description ?? this.description,
      attachmentName: attachmentName ?? this.attachmentName,
      attachmentUrl: attachmentUrl ?? this.attachmentUrl,
    );
  }

  @override
  String toString() {
    return 'GuideLineInfo(id: $id, uuid: $uuid, moduleName: $moduleName, moduleFullName: $moduleFullName, isDevelopmentModule: $isDevelopmentModule, logoName: $logoName, logoUrl: $logoUrl, isActive: $isActive, imsModuleId: $imsModuleId, imsModuleName: $imsModuleName, title: $title, description: $description, attachmentName: $attachmentName, attachmentUrl: $attachmentUrl)';
  }
}
