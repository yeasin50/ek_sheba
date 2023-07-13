import 'dart:convert';

import 'package:equatable/equatable.dart';

class ResourceInfo extends Equatable {
  const ResourceInfo({
    required this.id,
    required this.uuid,
    this.title,
    this.category,
    this.summary,
    this.year,
    this.month,
    this.publishedDate,
    this.attachmentName,
    this.attachmentUrl,
    this.isActive,
  });

  final int id;
  final String uuid;
  final String? title;
  final String? category;
  final String? summary;
  final String? year;
  final String? month;
  final String? publishedDate;
  final String? attachmentName;
  final String? attachmentUrl;
  final bool? isActive;

  @override
  List<Object?> get props =>
      [id, uuid, title, category, summary, year, month, publishedDate, attachmentName, attachmentUrl, isActive];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'uuid': uuid});
    if (title != null) {
      result.addAll({'title': title});
    }
    if (category != null) {
      result.addAll({'category': category});
    }
    if (summary != null) {
      result.addAll({'summary': summary});
    }
    if (year != null) {
      result.addAll({'year': year});
    }
    if (month != null) {
      result.addAll({'month': month});
    }
    if (publishedDate != null) {
      result.addAll({'publishedDate': publishedDate});
    }
    if (attachmentName != null) {
      result.addAll({'attachmentName': attachmentName});
    }
    if (attachmentUrl != null) {
      result.addAll({'attachmentUrl': attachmentUrl});
    }
    if (isActive != null) {
      result.addAll({'isActive': isActive});
    }

    return result;
  }

  factory ResourceInfo.fromMap(Map<String, dynamic> map) {
    return ResourceInfo(
      id: map['id']?.toInt() ?? 0,
      uuid: map['uuid'] ?? '',
      title: map['title'],
      category: map['category'],
      summary: map['summary'],
      year: map['year'],
      month: map['month'],
      publishedDate: map['publishedDate'],
      attachmentName: map['attachmentName'],
      attachmentUrl: map['attachmentUrl'],
      isActive: map['isActive'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceInfo.fromJson(String source) => ResourceInfo.fromMap(json.decode(source));

  ResourceInfo copyWith({
    int? id,
    String? uuid,
    String? title,
    String? category,
    String? summary,
    String? year,
    String? month,
    String? publishedDate,
    String? attachmentName,
    String? attachmentUrl,
    bool? isActive,
  }) {
    return ResourceInfo(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      title: title ?? this.title,
      category: category ?? this.category,
      summary: summary ?? this.summary,
      year: year ?? this.year,
      month: month ?? this.month,
      publishedDate: publishedDate ?? this.publishedDate,
      attachmentName: attachmentName ?? this.attachmentName,
      attachmentUrl: attachmentUrl ?? this.attachmentUrl,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  String toString() {
    return 'ResourceInfo(id: $id, uuid: $uuid, title: $title, category: $category, summary: $summary, year: $year, month: $month, publishedDate: $publishedDate, attachmentName: $attachmentName, attachmentUrl: $attachmentUrl, isActive: $isActive)';
  }
}
