import 'package:coresolutions/home/create/bloc/create_nature_bloc.dart';
import 'package:coresolutions/home/create/widgets/input_alias.dart';
import 'package:coresolutions/home/create/widgets/input_code.dart';
import 'package:coresolutions/home/create/widgets/input_description.dart';
import 'package:coresolutions/home/create/widgets/input_icon.dart';
import 'package:coresolutions/home/index/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class CreateNatureForm extends StatelessWidget {
  const CreateNatureForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<CreateNatureBloc, CreateNatureState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  // ignore: lines_longer_than_80_chars
                  '${(state.statusCode)}, ${state.statusMessages}',
                ),
              ),
            );
        }
        if (state.status.isSubmissionSuccess) {
          Navigator.of(context).pushAndRemoveUntil<void>(
            HomePage.route(),
            ModalRoute.withName('LocalizationsIndexPage'),
          );
        }
        if (state.status.isInvalid) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  state.statusMessages,
                ),
              ),
            );
        }
      },
      builder: (context, state) {
        // if (!state.loadData) {
        //   return SizedBox(
        //     height: MediaQuery.of(context).size.height * 0.8,
        //     child: const Center(child: CircularProgressIndicator()),
        //   );
        // }
        {
          return Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const InputAlias(),
                  const InputCode(),
                  const InputDescription(),
                  const InputIcon(),
                  const Padding(padding: EdgeInsets.all(12)),
                  _CreateButton(
                    formKey: formKey,
                    textButton: 'Crear Naturaleza',
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

class _CreateButton extends StatelessWidget {
  const _CreateButton({
    required this.formKey,
    required this.textButton,
  });

  final String textButton;

  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNatureBloc, CreateNatureState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? Column(
                children: [
                  const CircularProgressIndicator(),
                  Text('Creando Naturaleza'),
                ],
              )
            : SizedBox(
                width: 140,
                child: ElevatedButton(
                  key: const Key('CreateForm_continue_raisedButton'),
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      context.read<CreateNatureBloc>().add(
                            FieldsIsInvalid(
                              menssage: 'Elementos Requeridos',
                            ),
                          );
                      return;
                    }
                    formKey.currentState?.save();
                    context
                        .read<CreateNatureBloc>()
                        .add(const CreateSubmitted());
                  },
                  child: Text(textButton),
                ),
              );
      },
    );
  }
}
