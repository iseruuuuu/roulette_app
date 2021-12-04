import 'package:get/get.dart';
import 'package:roulette_app/model/todo.dart';

class AddScreenController extends GetxController {
  final _todos = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
    _todos.addAll(Todo.initialTodos);
  }

// TODO:フィルタの状態によって返すTodoを変える
  List<Todo> get todos => _todos;

  void addTodo(String description) {
    final todo = Todo(description: description);
    _todos.add(todo);
  }

  void remove(Todo todo) {
    _todos.remove(todo); // 等価性overrideしたのでOK
  }
}
