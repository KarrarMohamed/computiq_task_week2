import 'package:computiq_task_week2/state/my_state.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegionModalWidget extends ConsumerWidget {
  const RegionModalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,ScopedReader watch) {
    final stateNotifier = context.read(weatherStateProvider.notifier);
    return SizedBox(
      height: 500,
      child: ListView.builder(
        itemCount: stateNotifier.regions.length,
        itemBuilder: (context, pos) => ListTile(
          leading: const Icon(Icons.add_location),
          title: Text(stateNotifier.regions[pos]),
          onTap: () {
            Navigator.of(context).pop(stateNotifier.regions[pos]);
          },
        ),
      ),
    );
  }
}
