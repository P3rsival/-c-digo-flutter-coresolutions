import 'package:coresolutions/home/create/bloc/create_nature_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputAlias extends StatelessWidget {
  const InputAlias({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNatureBloc, CreateNatureState>(
      buildWhen: (previous, current) => previous.alias != current.alias,
      builder: (context, state) {
        return TextFormField(
          key: const Key('CreateForm_name_textField'),
          validator: (value) =>
              (value!.isEmpty) ? 'Validacion Requerida' : null,
          onSaved: (newValue) {
            if (newValue!.isNotEmpty) {
              context.read<CreateNatureBloc>().add(
                    CreateNameChanged(newValue),
                  );
            }
          },
          decoration: InputDecoration(
            labelText: 'Alias*',
          ),
        );
      },
    );
  }
}
