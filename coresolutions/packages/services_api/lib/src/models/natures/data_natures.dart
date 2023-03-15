import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_natures.g.dart';

@JsonSerializable()
class DataNatures extends Equatable {
  const DataNatures({
    this.id,
    this.type,
    this.attributes,
  });

  factory DataNatures.fromJson(Map<String, dynamic> json) =>
      _$DataNaturesFromJson(json);
  Map<String, dynamic> toJson() => _$DataNaturesToJson(this);

  final String? id;
  final String? type;
  final NaturesAttributes? attributes;

  @override
  List<Object?> get props => [
        id,
        type,
        attributes,
      ];
}

@JsonSerializable(fieldRename: FieldRename.snake)
class NaturesAttributes extends Equatable {
  const NaturesAttributes({
    this.code,
    this.id,
    this.alias,
    this.description,
    this.icon,
  });

  factory NaturesAttributes.fromJson(Map<String, dynamic> json) =>
      _$NaturesAttributesFromJson(json);
  Map<String, dynamic> toJson() => _$NaturesAttributesToJson(this);

  final String? code;
  final int? id;
  final String? alias;
  final String? description;
  final String? icon;

  @override
  List<Object?> get props => [
        code,
        id,
        alias,
        description,
        icon,
      ];
}
