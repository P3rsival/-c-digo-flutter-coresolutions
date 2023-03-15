
import 'package:flutter/material.dart';
import 'package:services_api/services_api.dart';

class NaturesListItem extends StatelessWidget {
  const NaturesListItem({super.key, required this.natures});

  final DataNatures natures;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${natures.attributes?.alias}'),
              Text('${natures.attributes?.code}'),
            ],
          ),
        ),
      ),
    );
  }
}
