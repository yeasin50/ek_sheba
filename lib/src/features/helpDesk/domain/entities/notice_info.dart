import 'dart:convert';

import 'package:equatable/equatable.dart';

class NoticeInfo extends Equatable {
  const NoticeInfo({
    required this.id,
    required this.uuid,
    this.title,
    this.summary,
    this.publishedDate,
    this.attachmentUrl,
    this.isActive,
  });

  final int id;
  final String uuid;
  final String? title;
  final String? summary;
  final String? publishedDate;
  final String? attachmentUrl;
  final bool? isActive;

  @override
  List<Object?> get props =>
      [id, uuid, title, summary, publishedDate, attachmentUrl, isActive];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'uuid': uuid});
    if (title != null) {
      result.addAll({'title': title});
    }
    if (summary != null) {
      result.addAll({'summary': summary});
    }
    if (publishedDate != null) {
      result.addAll({'publishedDate': publishedDate});
    }
    if (attachmentUrl != null) {
      result.addAll({'attachmentUrl': attachmentUrl});
    }
    if (isActive != null) {
      result.addAll({'isActive': isActive});
    }

    return result;
  }

  factory NoticeInfo.fromMap(Map<String, dynamic> map) {
    return NoticeInfo(
      id: map['id']?.toInt() ?? 0,
      uuid: map['uuid'] ?? '',
      title: map['title'],
      summary: map['summary'],
      publishedDate: map['publishedDate'],
      attachmentUrl: map['attachmentUrl'],
      isActive: map['isActive'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NoticeInfo.fromJson(String source) =>
      NoticeInfo.fromMap(json.decode(source));

  NoticeInfo copyWith({
    int? id,
    String? uuid,
    String? title,
    String? summary,
    String? publishedDate,
    String? attachmentUrl,
    bool? isActive,
  }) {
    return NoticeInfo(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      publishedDate: publishedDate ?? this.publishedDate,
      attachmentUrl: attachmentUrl ?? this.attachmentUrl,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  String toString() {
    return 'NoticeInfo(id: $id, uuid: $uuid, title: $title, summary: $summary, publishedDate: $publishedDate, attachmentUrl: $attachmentUrl, isActive: $isActive)';
  }
}
