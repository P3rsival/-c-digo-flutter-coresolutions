import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../models.dart';

part "login.g.dart";

@JsonSerializable()
class DataLogin extends Equatable {
  const DataLogin({
    required this.login,
    required this.user,
  });

  factory DataLogin.fromJson(Map<String, dynamic> json) =>
      _$DataLoginFromJson(json);
  Map<String, dynamic> toJson() => _$DataLoginToJson(this);

  final Login login;
  final DataUser user;

  @override
  List<Object?> get props => [
        login,
        user,
      ];

  @override
  bool get stringify => true;
}

@JsonSerializable()
class Login extends Equatable {
  const Login({
    required this.token,
    required this.refreshToken,
    required this.expiration,
    required this.expiredAt,
  });

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
  Map<String, dynamic> toJson() => _$LoginToJson(this);

  final String token;
  final String refreshToken;
  final int expiration;
  @JsonKey(name: 'expired_at')
  final DateTime expiredAt;

  @override
  List<Object?> get props => [
        token,
        refreshToken,
        expiration,
        expiredAt,
      ];
  @override
  bool get stringify => true;
}
