import 'dart:convert';

import 'package:equatable/equatable.dart';

class SystemUser extends Equatable {
  const SystemUser({
    required this.accessToken,
    this.tokenType,
    this.refreshToken,
    this.expiresIn,
    this.scope,
    this.id,
    this.name,
    this.username,
    this.email,
    this.appAccess,
    this.dutyType,
    this.userType,
    this.isInstitutional,
    this.organigationName,
    this.jti,
  });

  final String accessToken;
  final String? tokenType;
  final String? refreshToken;
  final int? expiresIn;
  final String? scope;

  final String? id;
  final String? name;
  final String? username;
  final String? email;
  final List<String>? appAccess;
  final String? dutyType;
  final String? userType;
  final String? isInstitutional;
  final String? organigationName;
  final String? jti;

  @override
  List<Object?> get props => [
        accessToken,
        tokenType,
        refreshToken,
        expiresIn,
        scope,
        id,
        name,
        username,
        email,
        appAccess,
        dutyType,
        userType,
        isInstitutional,
        organigationName,
        jti,
      ];

  SystemUser copyWith({
    String? accessToken,
    String? tokenType,
    String? refreshToken,
    int? expiresIn,
    String? scope,
    String? id,
    String? name,
    String? username,
    String? email,
    List<String>? appAccess,
    String? dutyType,
    String? userType,
    String? isInstitutional,
    String? organigationName,
    String? jti,
  }) {
    return SystemUser(
      accessToken: accessToken ?? this.accessToken,
      tokenType: tokenType ?? this.tokenType,
      refreshToken: refreshToken ?? this.refreshToken,
      expiresIn: expiresIn ?? this.expiresIn,
      scope: scope ?? this.scope,
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      appAccess: appAccess ?? this.appAccess,
      dutyType: dutyType ?? this.dutyType,
      userType: userType ?? this.userType,
      isInstitutional: isInstitutional ?? this.isInstitutional,
      organigationName: organigationName ?? this.organigationName,
      jti: jti ?? this.jti,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'access_token': accessToken});
    if (tokenType != null) {
      result.addAll({'token_type': tokenType});
    }
    if (refreshToken != null) {
      result.addAll({'refresh_token': refreshToken});
    }
    if (expiresIn != null) {
      result.addAll({'expires_in': expiresIn});
    }
    if (scope != null) {
      result.addAll({'scope': scope});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (username != null) {
      result.addAll({'username': username});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (appAccess != null) {
      result.addAll({'appAccess': appAccess});
    }
    if (dutyType != null) {
      result.addAll({'dutyType': dutyType});
    }
    if (userType != null) {
      result.addAll({'userType': userType});
    }
    if (isInstitutional != null) {
      result.addAll({'isInstitutional': isInstitutional});
    }
    if (organigationName != null) {
      result.addAll({'organigationName': organigationName});
    }
    if (jti != null) {
      result.addAll({'jti': jti});
    }
    return result;
  }

  factory SystemUser.fromMap(Map<String, dynamic> map) {
    return SystemUser(
      accessToken: map['access_token'] ?? '',
      tokenType: map['token_type'] ?? '',
      refreshToken: map['refresh_token'] ?? '',
      expiresIn: int.tryParse("${map['expires_in']}") ?? 0,
      scope: map['scope'] ?? '',
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      appAccess: List<String>.from(map['appAccess'] ?? const []),
      dutyType: map['dutyType'] ?? '',
      userType: map['userType'] ?? '',
      isInstitutional: map['isInstitutional'] ?? '',
      organigationName: map['organigationName'] ?? '',
      jti: map['jti'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SystemUser.fromJson(String source) =>
      SystemUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SystemUser(accessToken: $accessToken, tokenType: $tokenType, refreshToken: $refreshToken, expiresIn: $expiresIn, scope: $scope, id: $id, name: $name, username: $username, email: $email, appAccess: $appAccess, dutyType: $dutyType, userType: $userType, isInstitutional: $isInstitutional, organigationName: $organigationName, jti: $jti)';
  }
}
