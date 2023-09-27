import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String? username;
  final String? userAlias;
  final bool? active;
  final int? employeeRecordId;
  final String? lastPasswordChange;
  final String? failedAttemptLimitExceedTime;

  const User({
    required this.id,
    this.username,
    this.userAlias,
    this.active,
    this.employeeRecordId,
    this.lastPasswordChange,
    this.failedAttemptLimitExceedTime,
  });

  @override
  List<Object?> get props => [
        id,
        username,
        userAlias,
        active,
        employeeRecordId,
        lastPasswordChange,
        failedAttemptLimitExceedTime,
      ];

  User copyWith({
    int? id,
    String? username,
    String? userAlias,
    bool? active,
    int? employeeRecordId,
    String? lastPasswordChange,
    String? failedAttemptLimitExceedTime,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      userAlias: userAlias ?? this.userAlias,
      active: active ?? this.active,
      employeeRecordId: employeeRecordId ?? this.employeeRecordId,
      lastPasswordChange: lastPasswordChange ?? this.lastPasswordChange,
      failedAttemptLimitExceedTime:
          failedAttemptLimitExceedTime ?? this.failedAttemptLimitExceedTime,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    if (username != null) {
      result.addAll({'username': username});
    }
    if (userAlias != null) {
      result.addAll({'user_alias': userAlias});
    }
    if (active != null) {
      result.addAll({'active': active});
    }
    if (employeeRecordId != null) {
      result.addAll({'employee_record_id': employeeRecordId});
    }

    if (lastPasswordChange != null) {
      result.addAll({'last_password_change': lastPasswordChange});
    }
    if (failedAttemptLimitExceedTime != null) {
      result.addAll(
          {'failed_attempt_limit_exceed_time': failedAttemptLimitExceedTime});
    }
    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? 0,
      username: map['username'] ?? '',
      userAlias: map['user_alias'] ?? '',
      active: map['active'] ?? false,
      employeeRecordId: map['employee_record_id'] ?? 0,
      lastPasswordChange: map['last_password_change'] ?? '',
      failedAttemptLimitExceedTime:
          map['failed_attempt_limit_exceed_time'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, username: $username, userAlias: $userAlias, active: $active, employeeRecordId: $employeeRecordId, lastPasswordChange: $lastPasswordChange, failedAttemptLimitExceedTime: $failedAttemptLimitExceedTime)';
  }
}
