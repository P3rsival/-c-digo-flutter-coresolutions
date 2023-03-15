import 'package:authentication_repository/authentication_repository.dart';
import 'package:coresolutions/login/bloc/login_bloc.dart';
import 'package:coresolutions/recover/view/recover_page.dart';
import 'package:coresolutions/util_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../authentication/bloc/authentication_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Contraseña o Usuario Incorrectas'),
              ),
            );
        }
        if (state.status.isSubmissionSuccess) {
          context.read<AuthenticationBloc>().add(
              const AuthenticationStatusChanged(
                  AuthenticationStatus.authenticated));
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _UsernameInput(),
            const Padding(padding: EdgeInsets.all(12)),
            _PasswordInput(),
            // const Padding(padding: EdgeInsets.all(12)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil<void>(
                      RecoverPage.route(),
                      (route) => false,
                    );
                  },
                  child: const Text('¿Has olvidado tu contraseña?'),
                ),
              ),
            ),

            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.16),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: const Text(
                    "Si no dispones de una cuenta de usuario o tienes problemas para acceder, ponte en contacto con tu administrador.",
                    maxLines: 3,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(12)),
            _LoginButton(),
          ],
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: TextField(
            key: const Key('loginForm_usernameInput_textField'),
            controller: controller,
            keyboardType: TextInputType.emailAddress,
            onChanged: (username) =>
                context.read<LoginBloc>().add(LoginUsernameChanged(username)),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: controller.clear,
              ),
              filled: false,
              border: const OutlineInputBorder(),
              labelText: 'Email',
              errorText: state.username.invalid ? 'Correo Incorrecto' : null,
            ),
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatefulWidget {
  @override
  State<_PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<_PasswordInput> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: TextField(
            key: const Key('loginForm_passwordInput_textField'),
            onChanged: (password) =>
                context.read<LoginBloc>().add(LoginPasswordChanged(password)),
            obscureText: !showPassword,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  showPassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
              ),
              filled: false,
              border: const OutlineInputBorder(),
              labelText: 'Password',
              errorText: state.password.invalid ? 'Requerido' : null,
            ),
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                onPressed: state.status.isValidated
                    ? () {
                        ulog('Submited al pulsar el boton Paso 3');
                        context.read<LoginBloc>().add(const LoginSubmitted());
                      }
                    : null,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: const Align(
                    child: Text('Entrar'),
                  ),
                ),
              );
      },
    );
  }
}
