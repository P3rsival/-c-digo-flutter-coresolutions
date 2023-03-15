import 'package:coresolutions/login/bloc/login_bloc.dart';
import 'package:coresolutions/login/view/login_identity.dart';
import 'package:coresolutions/recover/view/recover_form.dart';
import 'package:coresolutions/recover/view/recover_identity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

class RecoverPage extends StatelessWidget {
  const RecoverPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const RecoverPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              const RecoverIdendity(),
              const SizedBox(height: 5),
              BlocProvider(
                create: (context) {
                  return LoginBloc(
                    userRepository: RepositoryProvider.of<UserRepository>(
                      context,
                    ),
                  );
                },
                child: const RecoverForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
