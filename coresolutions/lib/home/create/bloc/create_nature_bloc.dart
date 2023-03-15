import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:natures_repository/natures_repository.dart';

import '../../../model/nature_model.dart';

part 'create_nature_event.dart';
part 'create_nature_state.dart';

class CreateNatureBloc extends Bloc<CreateNatureEvent, CreateNatureState> {
  CreateNatureBloc({
    required NaturesRepository naturesRepository,
  })  : _naturesRepository = naturesRepository,
        super(const CreateNatureState()) {
    // on<CreateLoadData>(_onCreateLoadData);
    on<CreateNameChanged>(_onCreateNameChanged);
    on<CreateCodeChanged>(_onCreateCodeChanged);
    on<CreateDescriptionChanged>(_onCreateDescriptionChanged);
    on<CreateIconChanged>(_onCreateIconChanged);
    // on<NaturesChanged>(_onLocalizationsChanged);
    on<CreateSubmitted>(_onSubmitted);
  }

  final NaturesRepository _naturesRepository;

  void _onCreateNameChanged(
    CreateNameChanged event,
    Emitter<CreateNatureState> emit,
  ) {
    emit(
      state.copyWith(
        alias: event.alias,
      ),
    );
  }

  void _onCreateIconChanged(
    CreateIconChanged event,
    Emitter<CreateNatureState> emit,
  ) {
    emit(
      state.copyWith(
        icon: event.icon,
      ),
    );
  }

  void _onCreateCodeChanged(
    CreateCodeChanged event,
    Emitter<CreateNatureState> emit,
  ) {
    emit(
      state.copyWith(
        code: event.code,
      ),
    );
  }

  void _onCreateDescriptionChanged(
    CreateDescriptionChanged event,
    Emitter<CreateNatureState> emit,
  ) {
    emit(
      state.copyWith(
        description: event.description,
      ),
    );
  }

  Future<void> _onSubmitted(
    CreateSubmitted event,
    Emitter<CreateNatureState> emit,
  ) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      final fields = <String, dynamic>{}..addAll({
          'code': state.code,
          'alias': state.alias,
          'icon': state.icon,
          'description': state.description,
          'enabled': true,
        });

      await _naturesRepository.dataNaturesCreate(data: fields);

      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on HttpException catch (_) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          statusCode: 998,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          statusCode: 999,
        ),
      );
    }
  }
}
