import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/providers/supabase_provider.dart';
import '../domain/todo.dart';
import '../domain/todo_repository.dart';

part 'supabase_todo_repository.g.dart';

class SupabaseTodoRepository implements TodoRepository {
  SupabaseTodoRepository(this._client);

  final SupabaseClient _client;
  static const _table = 'todos';

  @override
  Stream<List<Todo>> watchTodos() {
    final userId = _client.auth.currentUser?.id;
    return _client
        .from(_table)
        .stream(primaryKey: ['id'])
        .eq('user_id', userId ?? '')
        .order('created_at')
        .map(
          (rows) => rows
              .map((row) => Todo.fromJson(_toJsonKeys(row)))
              .toList(),
        );
  }

  @override
  Future<void> addTodo(String title) async {
    final userId = _client.auth.currentUser!.id;
    await _client.from(_table).insert({
      'title': title,
      'user_id': userId,
      'is_completed': false,
    });
  }

  @override
  Future<void> toggleTodo(String id, {required bool isCompleted}) async {
    await _client
        .from(_table)
        .update({'is_completed': isCompleted})
        .eq('id', id);
  }

  @override
  Future<void> deleteTodo(String id) async {
    await _client.from(_table).delete().eq('id', id);
  }

  Map<String, dynamic> _toJsonKeys(Map<String, dynamic> row) => {
        'id': row['id'],
        'userId': row['user_id'],
        'title': row['title'],
        'isCompleted': row['is_completed'],
        'createdAt': row['created_at'],
      };
}

@Riverpod(keepAlive: true)
TodoRepository todoRepository(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return SupabaseTodoRepository(client);
}
