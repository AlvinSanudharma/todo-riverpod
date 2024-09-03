import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_riverpod/models/todo.dart';
import 'package:uuid/uuid.dart';

part 'todo_provider.g.dart';

@Riverpod(keepAlive: true)
class TodoNotifier extends _$TodoNotifier {
  @override
  List<Todo> build() {
    return <Todo>[];
  }

  add(String title, String body) {
    Todo newTodo = Todo(id: const Uuid().v4(), title: title, body: body);

    state = [...state, newTodo];
  }

  update(Todo newTodo) {
    int index = state.indexWhere(
      (el) => el.id == newTodo.id,
    );

    state[index] = newTodo;

    state = [...state];
  }

  remove(String id) {
    state.removeWhere(
      (el) => el.id == id,
    );

    state = [...state];
  }
}
