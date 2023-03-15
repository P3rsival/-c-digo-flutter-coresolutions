import 'package:coresolutions/home/create/bloc/create_nature_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputCode extends StatelessWidget {
  const InputCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return BlocBuilder<CreateNatureBloc, CreateNatureState>(
      buildWhen: (previous, current) => previous.code != current.code,
      builder: (context, state) {
        return TextFormField(
          key: const Key('CreateForm_code_textField'),
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) =>
              (value!.isEmpty) ? 'Validacion Requerida' : null,
          onSaved: (newValue) {
            context
                .read<CreateNatureBloc>()
                .add(CreateCodeChanged(newValue ?? ''));
          },
          decoration: InputDecoration(
            labelText: 'Codigo*',
          ),
        );
      },
    );
  }
}
