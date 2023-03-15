import 'package:coresolutions/home/index/bloc/nature_index_bloc_bloc.dart';
import 'package:coresolutions/home/index/widgets/nature_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NatureList extends StatefulWidget {
  const NatureList({super.key, required Column child});

  @override
  State<NatureList> createState() => _NatureListState();
}

class _NatureListState extends State<NatureList> {
  final _scrollController = ScrollController();

  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom &&
        context.read<NatureIndexBloc>().state.status !=
            IndexStatus.searchInProgress) {}
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<NatureIndexBloc, NatureIndexBlocState>(
          builder: (context, state) {
            return Expanded(
              child: _natureIndex(
                state,
              ),
            );
          },
        )
      ],
    );
  }

  Widget _natureIndex(NatureIndexBlocState state) {
    switch (state.status) {
      case IndexStatus.failure:
        return const Center(
          child: Text('No se encontraron Naturalezas'),
        );
      case IndexStatus.success:
        if (state.natures.isEmpty) {
          return const Center(
            child: Text('No se encontraron Naturalezas'),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemBuilder: (BuildContext context, int index) =>
              NaturesListItem(natures: state.natures[index]),
          itemCount: state.natures.length,
          controller: _scrollController,
        );
      case IndexStatus.initial:
        return const Center(child: CircularProgressIndicator());
      case IndexStatus.searchInProgress:
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemBuilder: (BuildContext context, int index) =>
              index >= state.natures.length
                  ? const Padding(
                      padding: EdgeInsets.all(16),
                      child: BottomLoader(),
                    )
                  : NaturesListItem(natures: state.natures[index]),
          itemCount: state.natures.length + 1,
          controller: _scrollController,
        );
    }
  }
}

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      ),
    );
  }
}
