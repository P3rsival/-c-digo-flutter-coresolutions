part of 'nature_index_bloc_bloc.dart';

enum IndexStatus { initial, success, searchInProgress, failure }

class NatureIndexBlocState extends Equatable {
  const NatureIndexBlocState({
    this.status = IndexStatus.initial,
    this.hasReachedMax = false,
    this.natures = const <DataNatures>[],
    this.statusCode = 0,
  });

  final IndexStatus status;
  final List<DataNatures> natures;
  final bool hasReachedMax;
  final int statusCode;
  NatureIndexBlocState copyWith({
    IndexStatus? status,
    List<DataNatures>? natures,
    bool? hasReachedMax,
    int? statusCode,
  }) {
    return NatureIndexBlocState(
      status: status ?? this.status,
      natures: natures ?? this.natures,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      statusCode: statusCode ?? this.statusCode,
    );
  }

  @override
  String toString() {
    return '''NaturesIndexState { status: $status, hasReachedMax: $hasReachedMax, asset: ${natures.length} }''';
  }

  @override
  List<Object> get props => [
        status,
        natures,
        hasReachedMax,
        statusCode,
      ];
}
