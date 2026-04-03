import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/router/app_router.dart';
import '../../../auth/ui/providers/auth_state.dart';
import '../providers/todos_state.dart';
import 'widgets/add_todo_field.dart';
import 'widgets/filter_bar.dart';
import 'widgets/todo_item.dart';

@RoutePage()
class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosAsync = ref.watch(filteredTodosProvider);
    final allTodos = ref.watch(todosProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('supapp'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sign out',
            onPressed: () async {
              await ref.read(authRepositoryProvider).signOut();
              if (context.mounted) {
                context.router.replaceAll([const LoginRoute()]);
              }
            },
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AddTodoField(),
                const SizedBox(height: 16),
                const FilterBar(),
                const SizedBox(height: 8),
                Expanded(
                  child: todosAsync.when(
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (e, _) => Center(child: Text('Error: $e')),
                    data: (todos) {
                      if (todos.isEmpty) {
                        return const Center(
                          child: Text('No todos yet — add one above!'),
                        );
                      }
                      return ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (_, i) => TodoItem(todo: todos[i]),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                allTodos.maybeWhen(
                  data: (todos) {
                    final remaining =
                        todos.where((t) => !t.isCompleted).length;
                    return Text(
                      '$remaining item${remaining == 1 ? '' : 's'} left',
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    );
                  },
                  orElse: () => const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
