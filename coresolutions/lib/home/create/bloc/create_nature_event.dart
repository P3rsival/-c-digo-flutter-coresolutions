part of 'create_nature_bloc.dart';

abstract class CreateNatureEvent extends Equatable {
  const CreateNatureEvent();

  @override
  List<Object> get props => [];
}

class CreateLoadData extends CreateNatureEvent {
  const CreateLoadData();
}

class CreateNameChanged extends CreateNatureEvent {
  const CreateNameChanged(this.alias);

  final String alias;

  @override
  List<Object> get props => [alias];
}

class CreateCodeChanged extends CreateNatureEvent {
  const CreateCodeChanged(this.code);

  final String code;

  @override
  List<Object> get props => [code];
}

class CreateDescriptionChanged extends CreateNatureEvent {
  const CreateDescriptionChanged(this.description);

  final String description;

  @override
  List<Object> get props => [description];
}

class CreateIconChanged extends CreateNatureEvent {
  const CreateIconChanged(this.icon);

  final String icon;

  @override
  List<Object> get props => [icon];
}

class NaturesChanged extends CreateNatureEvent {
  const NaturesChanged(this.listNature);

  final NatureModel listNature;

  @override
  List<Object> get props => [listNature];
}

class FieldsIsInvalid extends CreateNatureEvent {
  const FieldsIsInvalid({this.menssage = ''});

  final String menssage;

  @override
  List<Object> get props => [menssage];
}

class CreateSubmitted extends CreateNatureEvent {
  const CreateSubmitted();
}
