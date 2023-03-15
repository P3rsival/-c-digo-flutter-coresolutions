import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:services_api/src/models/natures/data_natures.dart';

part 'response_data_natures.g.dart';

@JsonSerializable()
class ResponseDataNatures extends Equatable {
  const ResponseDataNatures({
    this.success,
    this.code,
    this.locale,
    this.data,
  });

  factory ResponseDataNatures.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataNaturesFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseDataNaturesToJson(this);

  final bool? success;
  final int? code;
  final String? locale;
  final List<DataNatures>? data;

  @override
  List<Object?> get props => [
        success,
        code,
        locale,
        data,
      ];
}
