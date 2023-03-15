part of 'create_nature_bloc.dart';

class CreateNatureState extends Equatable {
  const CreateNatureState({
    this.status = FormzStatus.pure,
    this.statusCode = 200,
    this.statusMessages = '',
    this.code = '',
    this.alias = '',
    this.description = '',
    this.icon = '',
    this.loadData = false,
    this.listNature = const [],
  });

  final FormzStatus status;
  final int statusCode;
  final String statusMessages;
  final bool loadData;
  final String code;
  final String alias;
  final String description;
  final String icon;
  final List<NatureModel> listNature;

  CreateNatureState copyWith({
    FormzStatus? status,
    int? statusCode,
    String? statusMessages,
    String? code,
    String? alias,
    String? description,
    String? icon,
    List<NatureModel>? listNature,
    bool? loadData,
  }) {
    return CreateNatureState(
      status: status ?? this.status,
      statusCode: statusCode ?? this.statusCode,
      statusMessages: statusMessages ?? this.statusMessages,
      code: code ?? this.code,
      alias: alias ?? this.alias,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      // listNature:
      //     listNature ?? this.listNature,
      loadData: loadData ?? this.loadData,
    );
  }

  @override
  List<Object> get props => [
        status,
        statusCode,
        statusMessages,
        code,
        alias,
        description,
        icon,
        // listNature,
      ];
}
