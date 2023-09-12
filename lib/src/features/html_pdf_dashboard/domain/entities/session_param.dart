import 'dart:convert';

import 'package:equatable/equatable.dart';

class SeasonParams extends Equatable {
  final String sessionId;
  final String accessToken;
  final String doptorToken;

  ///! this can also be recognized by  [doptorToken] which is empty for system user
  final bool isSystemUser;

  const SeasonParams({
    required this.sessionId,
    required this.accessToken,
    required this.doptorToken,
    this.isSystemUser = false,
  });

  @override
  List<Object?> get props => [sessionId, accessToken, doptorToken, isSystemUser];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'sessionId': sessionId});
    result.addAll({'accessToken': accessToken});
    result.addAll({'doptorToken': doptorToken});

    return result;
  }

  factory SeasonParams.fromMap(Map<String, dynamic> map) {
    return SeasonParams(
      sessionId: map['sessionId'] ?? '',
      accessToken: map['accessToken'] ?? '',
      doptorToken: map['doptorToken'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SeasonParams.fromJson(String source) => SeasonParams.fromMap(json.decode(source));

  SeasonParams copyWith({
    String? sessionId,
    String? accessToken,
    String? doptorToken,
    bool? isSystemUser,
  }) {
    return SeasonParams(
      sessionId: sessionId ?? this.sessionId,
      accessToken: accessToken ?? this.accessToken,
      doptorToken: doptorToken ?? this.doptorToken,
      isSystemUser: isSystemUser ?? this.isSystemUser,
    );
  }

  @override
  String toString() {
    return 'SeasonParams(sessionId: $sessionId, accessToken: $accessToken, doptorToken: $doptorToken, isSystemUser: $isSystemUser)';
  }
}
