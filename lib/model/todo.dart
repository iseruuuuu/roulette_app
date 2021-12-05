import 'package:flutter/cupertino.dart';

@immutable
class Todo {
  final String id;
  final String description;

  // 説明【1】
  Todo({required this.description})
      : id = DateTime.now().millisecondsSinceEpoch.toString();

  // 説明【2】
  const Todo.withId({required this.id, required this.description});

  // // サンプルタスク
  // static const initialTodos = [
  //   Todo.withId(
  //     id: '0',
  //     description: '犬の散歩',
  //   ),
  //   Todo.withId(
  //     id: '1',
  //     description: '犬の散歩',
  //   ),
  // ];
}
