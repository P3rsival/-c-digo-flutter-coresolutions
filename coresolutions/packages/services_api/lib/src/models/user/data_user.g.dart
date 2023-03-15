// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataUser _$DataUserFromJson(Map<String, dynamic> json) => DataUser(
      id: json['id'] as String,
      type: json['type'] as String,
      attributes:
          UserAttributes.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataUserToJson(DataUser instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'attributes': instance.attributes,
    };

UserAttributes _$UserAttributesFromJson(Map<String, dynamic> json) =>
    UserAttributes(
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UserAttributesToJson(UserAttributes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
    };
