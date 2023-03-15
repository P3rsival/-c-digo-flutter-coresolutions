import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "data_user.g.dart";

@JsonSerializable()
class DataUser extends Equatable {
  const DataUser({
    required this.id,
    required this.type,
    required this.attributes,
  });

  factory DataUser.fromJson(Map<String, dynamic> json) =>
      _$DataUserFromJson(json);
  Map<String, dynamic> toJson() => _$DataUserToJson(this);

  final String id;
  final String type;
  final UserAttributes attributes;

  @override
  List<Object?> get props => [
        id,
        type,
        attributes,
      ];

  @override
  bool get stringify => true;
}

@JsonSerializable()
class UserAttributes extends Equatable {
  const UserAttributes({
    required this.name,
    required this.email,
  });

  factory UserAttributes.fromJson(Map<String, dynamic> json) =>
      _$UserAttributesFromJson(json);
  Map<String, dynamic> toJson() => _$UserAttributesToJson(this);

  final String name;
  final String email;

  @override
  List<Object?> get props => [name, email];

  @override
  bool get stringify => true;
}
