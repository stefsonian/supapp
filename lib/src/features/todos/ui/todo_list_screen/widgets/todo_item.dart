import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/todo.dart';
import '../../providers/todos_state.dart';

class TodoItem extends ConsumerWidget {
  const TodoItem({required this.todo, super.key});

  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(todosProvider.notifier);

    return ListTile(
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (value) => notifier.toggleTodo(
          todo.id,
          isCompleted: value ?? false,
        ),
      ),
      title: Text(
        todo.title,
        style: todo.isCompleted
            ? const TextStyle(decoration: TextDecoration.lineThrough)
            : null,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        tooltip: 'Delete',
        onPressed: () => notifier.deleteTodo(todo.id),
      ),
    );
  }
}
