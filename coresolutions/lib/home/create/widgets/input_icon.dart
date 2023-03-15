import 'package:coresolutions/home/create/bloc/create_nature_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputIcon extends StatelessWidget {
  const InputIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return BlocBuilder<CreateNatureBloc, CreateNatureState>(
      buildWhen: (previous, current) => previous.icon != current.icon,
      builder: (context, state) {
        return TextFormField(
          key: const Key('CreateForm_code_textField'),
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSaved: (newValue) {
            context
                .read<CreateNatureBloc>()
                .add(CreateIconChanged(newValue ?? ''));
          },
          decoration: InputDecoration(
            labelText: 'Icono',
          ),
        );
      },
    );
  }
}
