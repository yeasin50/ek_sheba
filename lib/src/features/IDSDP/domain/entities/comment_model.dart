import 'dart:convert';

class Commenter {
  final int id;
  final String userId;
  final String name;
  final String emailId;
  final String designation;
  Commenter({
    required this.id,
    required this.userId,
    required this.name,
    required this.emailId,
    required this.designation,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'userId': userId});
    result.addAll({'name': name});
    result.addAll({'emailId': emailId});
    result.addAll({'designation': designation});

    return result;
  }

  factory Commenter.fromMap(Map<String, dynamic> map) {
    return Commenter(
      id: map['id']?.toInt() ?? 0,
      userId: map['userId'] ?? '',
      name: map['name'] ?? '',
      emailId: map['emailId'] ?? '',
      designation: map['designation'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Commenter.fromJson(String source) => Commenter.fromMap(json.decode(source));
}

class Comment {
  final int id;
  final String uuid;
  final int sourceId;
  final String commentsSource;
  final String comment;
  final String observer;
  final int commentBy;
  final String commentOn;
  final Commenter commenter;
  final bool canEdit;
  final bool canAdd;
  Comment({
    required this.id,
    required this.uuid,
    required this.sourceId,
    required this.commentsSource,
    required this.comment,
    required this.observer,
    required this.commentBy,
    required this.commentOn,
    required this.commenter,
    required this.canEdit,
    required this.canAdd,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'uuid': uuid});
    result.addAll({'sourceId': sourceId});
    result.addAll({'commentsSource': commentsSource});
    result.addAll({'comment': comment});
    result.addAll({'observer': observer});
    result.addAll({'commentBy': commentBy});
    result.addAll({'commentOn': commentOn});
    result.addAll({'commenter': commenter.toMap()});
    result.addAll({'canEdit': canEdit});
    result.addAll({'canAdd': canAdd});

    return result;
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['id']?.toInt() ?? 0,
      uuid: map['uuid'] ?? '',
      sourceId: map['sourceId']?.toInt() ?? 0,
      commentsSource: map['commentsSource'] ?? '',
      comment: map['comment'] ?? '',
      observer: map['observer'] ?? '',
      commentBy: map['commentBy']?.toInt() ?? 0,
      commentOn: map['commentOn'] ?? '',
      commenter: Commenter.fromMap(map['commenter']),
      canEdit: map['canEdit'] ?? false,
      canAdd: map['canAdd'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) => Comment.fromMap(json.decode(source));
}
