import 'dart:convert';

import 'package:equatable/equatable.dart';

class SessionResponse extends Equatable {
  final String accessToken;
  final String sessionId;
  final String doptorToken;
  final String creationTime;

  const SessionResponse({
    required this.accessToken,
    required this.sessionId,
    required this.doptorToken,
    required this.creationTime,
  });

  @override
  List<Object?> get props =>
      [accessToken, sessionId, doptorToken, creationTime];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'accessToken': accessToken});
    result.addAll({'sessionId': sessionId});
    result.addAll({'doptorToken': doptorToken});
    result.addAll({'creationTime': creationTime});

    return result;
  }

  factory SessionResponse.fromMap(Map<String, dynamic> map) {
    return SessionResponse(
      accessToken: map['accessToken'] ?? '',
      sessionId: map['sessionId'] ?? '',
      doptorToken: map['doptorToken'] ?? '',
      creationTime: map['creationTime'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SessionResponse.fromJson(String source) =>
      SessionResponse.fromMap(json.decode(source));

  SessionResponse copyWith({
    String? accessToken,
    String? sessionId,
    String? doptorToken,
    String? creationTime,
  }) {
    return SessionResponse(
      accessToken: accessToken ?? this.accessToken,
      sessionId: sessionId ?? this.sessionId,
      doptorToken: doptorToken ?? this.doptorToken,
      creationTime: creationTime ?? this.creationTime,
    );
  }

  @override
  String toString() {
    return 'SessionResponse(accessToken: $accessToken, sessionId: $sessionId, doptorToken: $doptorToken, creationTime: $creationTime)';
  }
}
