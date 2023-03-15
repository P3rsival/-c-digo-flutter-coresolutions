import 'package:coresolutions/home/create/view/create_nature_page.dart';
import 'package:coresolutions/home/index/view/nature_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natures_repository/natures_repository.dart';

import '../../../authentication/bloc/authentication_bloc.dart';
import '../bloc/nature_index_bloc_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(CreateNaturePage.route());
        },
      ),
      drawer: ElevatedButton(
        child: const Text('Logout'),
        onPressed: () {
          context
              .read<AuthenticationBloc>()
              .add(AuthenticationLogoutRequested());
        },
      ),
      appBar: AppBar(title: const Text('Naturalezas')),
      body: Center(
        child: BlocProvider(
          create: (_) => NatureIndexBloc(
            naturesRepository: RepositoryProvider.of<NaturesRepository>(
              context,
            ),
          )..add(NatureIndexFetched()),
          child: NatureList(
            child: Column(),
          ),
        ),
      ),
    );
  }
}
