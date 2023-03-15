import 'package:coresolutions/login/bloc/login_bloc.dart';
import 'package:coresolutions/login/view/login_page.dart';
import 'package:coresolutions/util_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class RecoverForm extends StatelessWidget {
  const RecoverForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -1 / 3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _UsernameInput(),
          const Padding(padding: EdgeInsets.all(12)),
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
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.15),
              _LoginButton(),
              _CancelButton(),
            ],
          ),
        ],
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
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: const Align(
                    child: Text('Entrar'),
                  ),
                ),
              );
      },
    );
  }
}

class _CancelButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil<void>(
                    LoginPage.route(),
                    (route) => false,
                  );
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: const Align(
                    child: Text('Cancelar'),
                  ),
                ),
              );
      },
    );
  }
}
