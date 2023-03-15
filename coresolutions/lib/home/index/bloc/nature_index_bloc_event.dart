part of 'nature_index_bloc_bloc.dart';

abstract class NatureIndexBlocEvent extends Equatable {
  const NatureIndexBlocEvent();

  @override
  List<Object> get props => [];
}

class NatureIndexFetched extends NatureIndexBlocEvent {}

// class NatureIndexRestart extends NatureIndexBlocEvent {}
