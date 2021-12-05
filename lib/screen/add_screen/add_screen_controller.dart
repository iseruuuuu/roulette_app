import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:roulette_app/model/todo.dart';
import 'package:roulette_app/preference/preference.dart';
import 'package:roulette_app/screen/roulette_screen/roulette_screen.dart';

import '../tutorial_screen/tutorial_screen.dart';

class AddScreenController extends GetxController {
  final _todos = <Todo>[].obs;
  final contents = ''.obs;
  final isTutorial = false.obs;

  @override
  void onInit() {
    super.onInit();

    sharedPreference();
  }

  void sharedPreference() async {
    print(isTutorial.value);
    isTutorial.value = await Preference().getBool(PreferenceKey.isTutorial);

    //初回起動のみ
    if (!isTutorial.value) {
      showCupertinoModalBottomSheet(
        expand: true,
        context: Get.context!,
        builder: (context) => const TutorialScreen(),
      );
    }
    await Preference().setBool(PreferenceKey.isTutorial, true);
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

  void onTap() {
    if (todos.isEmpty) {
      Get.snackbar(
        "値を登録してください",
        "ルーレットを行うために1つ以上の登録が必要です!!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
      );
    } else {
      Get.to(() => RouletteScreen(rouletteItem: todos));
    }
  }

  void showAlert(BuildContext context) async {
    if (isTutorial.value) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content: Text("hi"),
        ),
      );
      await Preference().setBool(PreferenceKey.isTutorial, false);
    }
    await Preference().setBool(PreferenceKey.isTutorial, false);
  }
}
