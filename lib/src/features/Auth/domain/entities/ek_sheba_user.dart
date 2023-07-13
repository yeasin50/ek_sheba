import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'user.dart';

class EkShebaUser extends Equatable {
  const EkShebaUser({
    required this.user,
    required this.token,
  });

  final User user;
  final String token;

  @override
  List<Object?> get props => [user, token];

  EkShebaUser copyWith({
    User? user,
    String? token,
  }) {
    return EkShebaUser(
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'user': user.toMap()});
    result.addAll({'access_token': token});

    return result;
  }

  factory EkShebaUser.fromMap(Map<String, dynamic> map) {
    return EkShebaUser(
      user: User.fromMap(map['user']),
      token: map['access_token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EkShebaUser.fromJson(String source) => EkShebaUser.fromMap(json.decode(source));

  @override
  String toString() => 'EkShebaUser(user: $user, token: $token)';
}
