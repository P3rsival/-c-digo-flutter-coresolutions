part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    this.statusCode = 200,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
  });

  final FormzStatus status;
  final int statusCode;
  final Username username;
  final Password password;

  LoginState copyWith({
    FormzStatus? status,
    int? statusCode,
    Username? username,
    Password? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      statusCode: statusCode ?? this.statusCode,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, statusCode, username, password];
}
