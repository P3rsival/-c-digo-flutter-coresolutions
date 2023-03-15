// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_natures.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataNatures _$DataNaturesFromJson(Map<String, dynamic> json) => DataNatures(
      id: json['id'] as String?,
      type: json['type'] as String?,
      attributes: json['attributes'] == null
          ? null
          : NaturesAttributes.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataNaturesToJson(DataNatures instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'attributes': instance.attributes,
    };

NaturesAttributes _$NaturesAttributesFromJson(Map<String, dynamic> json) =>
    NaturesAttributes(
      code: json['code'] as String?,
      id: json['id'] as int?,
      alias: json['alias'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$NaturesAttributesToJson(NaturesAttributes instance) =>
    <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
      'alias': instance.alias,
      'description': instance.description,
      'icon': instance.icon,
    };
