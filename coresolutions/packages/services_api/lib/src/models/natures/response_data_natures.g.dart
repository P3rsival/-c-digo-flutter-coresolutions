// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_data_natures.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseDataNatures _$ResponseDataNaturesFromJson(Map<String, dynamic> json) =>
    ResponseDataNatures(
      success: json['success'] as bool?,
      code: json['code'] as int?,
      locale: json['locale'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataNatures.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseDataNaturesToJson(
        ResponseDataNatures instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'locale': instance.locale,
      'data': instance.data,
    };
