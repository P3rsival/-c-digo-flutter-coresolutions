import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:natures_repository/natures_repository.dart';
import 'package:services_api/services_api.dart';

part 'nature_index_bloc_event.dart';
part 'nature_index_bloc_state.dart';

class NatureIndexBloc extends Bloc<NatureIndexBlocEvent, NatureIndexBlocState> {
  NatureIndexBloc({
    required NaturesRepository naturesRepository,
  })  : _naturesRepository = naturesRepository,
        super(const NatureIndexBlocState()) {
    on<NatureIndexFetched>((_onNatureIndexFetched));
  }
  final NaturesRepository _naturesRepository;

  Future<void> _onNatureIndexFetched(
    NatureIndexFetched event,
    Emitter<NatureIndexBlocState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      emit(const NatureIndexBlocState(status: IndexStatus.searchInProgress));
      final naturesData = await _fetchAssetsIndex();
      return emit(
        state.copyWith(
          status: IndexStatus.success,
          hasReachedMax: false,
          natures: naturesData.data,
        ),
      );
    } on HttpException catch (_) {
      emit(
        state.copyWith(
          status: IndexStatus.failure,
          statusCode: 998,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          statusCode: 999,
        ),
      );
    }
  }

  Future<ResponseDataNatures> _fetchAssetsIndex() async {
    try {
      return await _naturesRepository.getdataNaturesIndex();
    } catch (e) {
      throw Exception('error fetching asset');
    }
  }
}
