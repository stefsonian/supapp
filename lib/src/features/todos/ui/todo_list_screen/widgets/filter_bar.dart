import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/todos_state.dart';

class FilterBar extends ConsumerWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(todoFilterProvider);
    final notifier = ref.read(todoFilterProvider.notifier);

    return SegmentedButton<TodoFilter>(
      segments: const [
        ButtonSegment(value: TodoFilter.all, label: Text('All')),
        ButtonSegment(value: TodoFilter.active, label: Text('Active')),
        ButtonSegment(value: TodoFilter.completed, label: Text('Completed')),
      ],
      selected: {filter},
      onSelectionChanged: (selection) => notifier.set(selection.first),
    );
  }
}
