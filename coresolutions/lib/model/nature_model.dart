import 'package:equatable/equatable.dart';

class NatureModel extends Equatable {
  const NatureModel({
    this.code,
    this.alias,
    this.description,
    this.icon,
  });

  final int? code;
  final String? alias;
  final String? description;
  final String? icon;

  String asString() {
    return '$code $alias';
  }

  @override
  String toString() => '$code $alias';

  @override
  List<Object?> get props => [
        code,
        alias,
        description,
        icon,
      ];
}
