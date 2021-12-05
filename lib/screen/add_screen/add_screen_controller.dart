import 'package:get/get.dart';
import 'package:roulette_app/model/todo.dart';

class AddScreenController extends GetxController {
  final _todos = <Todo>[].obs;
  final contents = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

// TODO:フィルタの状態によって返すTodoを変える
  List<Todo> get todos => _todos;

  void addTodo(String description) {
    contents.value = description;
    if (contents.value == '') {
    } else {
      final todo = Todo(description: contents.value);
      _todos.add(todo);
    }
  }

  void remove(Todo todo) {
    _todos.remove(todo);
  }

  void onChanged(String text) {
    contents.value = text;
  }
}
