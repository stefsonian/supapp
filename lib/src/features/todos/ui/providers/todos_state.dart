import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/supabase_todo_repository.dart';
import '../../domain/todo.dart';

part 'todos_state.g.dart';

enum TodoFilter { all, active, completed }

@riverpod
class TodoFilterNotifier extends _$TodoFilterNotifier {
  @override
  TodoFilter build() => TodoFilter.all;

  void set(TodoFilter filter) => state = filter;
}

@riverpod
class TodosNotifier extends _$TodosNotifier {
  @override
  Stream<List<Todo>> build() {
    final repo = ref.watch(todoRepositoryProvider);
    return repo.watchTodos();
  }

  Future<void> addTodo(String title) async {
    await ref.read(todoRepositoryProvider).addTodo(title);
  }

  Future<void> toggleTodo(String id, {required bool isCompleted}) async {
    await ref
        .read(todoRepositoryProvider)
        .toggleTodo(id, isCompleted: isCompleted);
  }

  Future<void> deleteTodo(String id) async {
    await ref.read(todoRepositoryProvider).deleteTodo(id);
  }
}

@riverpod
AsyncValue<List<Todo>> filteredTodos(Ref ref) {
  final filter = ref.watch(todoFilterProvider);
  return ref.watch(todosProvider).whenData((todos) {
    return switch (filter) {
      TodoFilter.all => todos,
      TodoFilter.active => todos.where((t) => !t.isCompleted).toList(),
      TodoFilter.completed => todos.where((t) => t.isCompleted).toList(),
    };
  });
}
