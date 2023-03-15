// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataLogin _$DataLoginFromJson(Map<String, dynamic> json) => DataLogin(
      login: Login.fromJson(json['login'] as Map<String, dynamic>),
      user: DataUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataLoginToJson(DataLogin instance) => <String, dynamic>{
      'login': instance.login,
      'user': instance.user,
    };

Login _$LoginFromJson(Map<String, dynamic> json) => Login(
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
      expiration: json['expiration'] as int,
      expiredAt: DateTime.parse(json['expired_at'] as String),
    );

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'expiration': instance.expiration,
      'expired_at': instance.expiredAt.toIso8601String(),
    };
