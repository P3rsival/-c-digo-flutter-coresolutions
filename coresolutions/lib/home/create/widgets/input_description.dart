import 'package:coresolutions/home/create/bloc/create_nature_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputDescription extends StatelessWidget {
  const InputDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNatureBloc, CreateNatureState>(
      buildWhen: (previous, current) =>
          previous.description != current.description,
      builder: (context, state) {
        return TextFormField(
          key: const Key('CreateForm_description_textField'),
          validator: (value) =>
              (value!.isEmpty) ? 'Validacion Requerida' : null,
          onSaved: (newValue) {
            if (newValue!.isNotEmpty) {
              context.read<CreateNatureBloc>().add(
                    CreateDescriptionChanged(newValue),
                  );
            }
          },
          decoration: InputDecoration(
            labelText: 'Descripcion*',
          ),
        );
      },
    );
  }
}
