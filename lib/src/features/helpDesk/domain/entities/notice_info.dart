import 'dart:convert';

import 'package:equatable/equatable.dart';

///kinda duplicate of [NoticeInfo] but 
class NoticeInfo extends Equatable {
  const NoticeInfo({
    this.id,
    required this.title,
    required this.description,
    required this.url,
  });

  final String? id;
  final String title;
  final String description;
  final String url;

  @override
  List<Object?> get props => [id, title, description, url];

  NoticeInfo copyWith({
    String? id,
    String? title,
    String? description,
    String? url,
  }) {
    return NoticeInfo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'url': url});

    return result;
  }

  factory NoticeInfo.fromMap(Map<String, dynamic> map) {
    return NoticeInfo(
      id: map['id'],
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NoticeInfo.fromJson(String source) => NoticeInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NoticeInfo(id: $id, title: $title, description: $description, url: $url)';
  }
}
