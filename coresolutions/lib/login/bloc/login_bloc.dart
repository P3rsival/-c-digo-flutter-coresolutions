import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:coresolutions/util_print.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:user_repository/user_repository.dart';
import '../models/models.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const LoginState()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }
  final UserRepository _userRepository;

  void _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    final username = Username.dirty(event.username);
    emit(
      state.copyWith(
        username: username,
        status: Formz.validate([state.password, username]),
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([password, state.username]),
      ),
    );
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      ulog('paso 4');
      try {
        final dataLogin = await _userRepository.login(
          username: state.username.value,
          password: state.password.value,
        );
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } on HttpException catch (_) {
        emit(
          state.copyWith(
            status: FormzStatus.submissionFailure,
            statusCode: 404,
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
}
