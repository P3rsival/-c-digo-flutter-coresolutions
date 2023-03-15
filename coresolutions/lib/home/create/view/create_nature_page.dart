import 'package:coresolutions/home/create/view/create_nature_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natures_repository/natures_repository.dart';

import '../bloc/create_nature_bloc.dart';

class CreateNaturePage extends StatelessWidget {
  const CreateNaturePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const CreateNaturePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Theme.of(context).colorScheme.primary,
        ),
        title: Text(
          'Crear Naturaleza',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ),
      body: ColoredBox(
        color: Theme.of(context).colorScheme.background,
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) {
              return CreateNatureBloc(
                naturesRepository:
                    RepositoryProvider.of<NaturesRepository>(context),
              );
              // ..add(const StoreLoadData());
            },
            child: const CreateNatureForm(),
          ),
        ),
      ),
    );
  }
}
