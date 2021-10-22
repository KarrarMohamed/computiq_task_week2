import 'package:computiq_task_week2/core/colors.dart';
import 'package:computiq_task_week2/state/my_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'regions_modal_widget.dart';

class RegionSelector extends ConsumerWidget {
  const RegionSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final stateNotifier = watch(weatherStateProvider.notifier);
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () async {
          var selectedRegion = await showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            builder: (context) => const RegionModalWidget(),
          );
          await Future.delayed(const Duration(milliseconds: 500));
          if (selectedRegion != null) {
            context.read(weatherStateProvider.notifier).updateCurrentRegion(selectedRegion);
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              stateNotifier.currentRegion,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
