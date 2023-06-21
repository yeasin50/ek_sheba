import 'dart:convert';

import 'package:equatable/equatable.dart';

class ResourceInfo extends Equatable {
  const ResourceInfo({
    this.id,
    required this.title,
    this.category,
    required this.summary,
    required this.createdAt,
    required this.url,
  });

  final String? id;
  final String title;
  final String? category;
  final String summary;
  final DateTime createdAt;
  final String url;

  @override
  List<Object?> get props => [id, summary, title, category, createdAt, url];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }

    result.addAll({'title': title});

    if (category != null) {
      result.addAll({'category': category});
    }
    result.addAll({'summary': summary});
    result.addAll({'createdAt': createdAt.millisecondsSinceEpoch});
    result.addAll({'url': url});

    return result;
  }

  factory ResourceInfo.fromMap(Map<String, dynamic> map) {
    return ResourceInfo(
      id: map['id'],
      title: map['title'] ?? '',
      category: map['category'],
      summary: map['summary'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceInfo.fromJson(String source) => ResourceInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ResourceInfo(id: $id, title: $title, category: $category, summary: $summary, createdAt: $createdAt, url: $url)';
  }

  ResourceInfo copyWith({
    String? id,
    String? title,
    String? category,
    String? summary,
    DateTime? createdAt,
    String? url,
  }) {
    return ResourceInfo(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      summary: summary ?? this.summary,
      createdAt: createdAt ?? this.createdAt,
      url: url ?? this.url,
    );
  }
}
