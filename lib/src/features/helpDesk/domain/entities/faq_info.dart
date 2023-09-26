import 'dart:convert';

import 'package:equatable/equatable.dart';

class FAQModule extends Equatable {
  const FAQModule({
    this.id,
    this.uuid,
    this.moduleName,
    this.moduleFullName,
    this.isDevelopmentModule,
    this.logoName,
    this.logoUrl,
    this.isActive,
    this.imsModuleId,
    this.imsModuleName,
    this.question,
    this.answer,
  });

  /// on search result
  const FAQModule.searchResult({
    this.id,
    this.uuid,
    this.imsModuleId,
    this.imsModuleName,
    this.question,
    this.answer,
    this.isActive,
  })  : moduleName = null,
        moduleFullName = null,
        isDevelopmentModule = null,
        logoName = null,
        logoUrl = null;

  final int? id;
  final String? uuid;
  final String? moduleName;
  final String? moduleFullName;
  final bool? isDevelopmentModule;
  final String? logoName;
  final String? logoUrl;
  final bool? isActive;

  /// on search result
  final String? imsModuleId;
  final String? imsModuleName;
  final String? question;
  final String? answer;

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
        question,
        answer,
      ];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (uuid != null) {
      result.addAll({'uuid': uuid});
    }
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
    if (question != null) {
      result.addAll({'question': question});
    }
    if (answer != null) {
      result.addAll({'answer': answer});
    }

    return result;
  }

  @override
  String toString() {
    return 'FAQModule(id: $id, uuid: $uuid, moduleName: $moduleName, moduleFullName: $moduleFullName, isDevelopmentModule: $isDevelopmentModule, logoName: $logoName, logoUrl: $logoUrl, isActive: $isActive, imsModuleId: $imsModuleId, imsModuleName: $imsModuleName, question: $question, answer: $answer)';
  }

  factory FAQModule.fromMap(Map<String, dynamic> map) {
    return FAQModule(
      id: map['id']?.toInt(),
      uuid: map['uuid'],
      moduleName: map['moduleName'],
      moduleFullName: map['moduleFullName'],
      isDevelopmentModule: map['isDevelopmentModule'],
      logoName: map['logoName'],
      logoUrl: map['logoUrl'],
      isActive: map['isActive'],
      imsModuleId: map['imsModuleId'],
      imsModuleName: map['imsModuleName'],
      question: map['question'],
      answer: map['answer'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FAQModule.fromJson(String source) =>
      FAQModule.fromMap(json.decode(source));

  FAQModule copyWith({
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
    String? question,
    String? answer,
  }) {
    return FAQModule(
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
      question: question ?? this.question,
      answer: answer ?? this.answer,
    );
  }
}
