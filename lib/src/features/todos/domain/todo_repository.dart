import 'todo.dart';

abstract class TodoRepository {
  Stream<List<Todo>> watchTodos();
  Future<void> addTodo(String title);
  Future<void> toggleTodo(String id, {required bool isCompleted});
  Future<void> deleteTodo(String id);
}
