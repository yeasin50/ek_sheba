import 'dart:convert';

import 'package:equatable/equatable.dart';

class GuideLineInfo extends Equatable {
  const GuideLineInfo({
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

  GuideLineInfo copyWith({
    String? id,
    String? title,
    String? description,
    String? url,
  }) {
    return GuideLineInfo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
    );
  }

  @override
  String toString() {
    return 'GuideLineInfo(id: $id, title: $title, description: $description, url: $url)';
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

  factory GuideLineInfo.fromMap(Map<String, dynamic> map) {
    return GuideLineInfo(
      id: map['id'],
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GuideLineInfo.fromJson(String source) => GuideLineInfo.fromMap(json.decode(source));
}
