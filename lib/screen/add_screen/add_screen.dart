import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../component/roulette_list.dart';
import 'add_screen_controller.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddScreenController());
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => controller.onTapTutorial(),
          icon: const Icon(
            Icons.apps,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => controller.onTap(),
            child: const Text(
              'ルーレット',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 10,
              child: Obx(
                () {
                  final todos = controller.todos;
                  return ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      return RouletteList(
                        todo: todo,
                        onTap: () => controller.remove(todo),
                      );
                    },
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: deviceSize.width - 120,

                      //TODO 文字のサイズとかを調整したい!!
                      child: TextField(
                        onChanged: (text) => controller.onChanged(text),
                        style: const TextStyle(
                          fontSize: 30.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        elevation: 30,
                      ),
                      onPressed: () {
                        controller.addTodo(controller.contents.value);
                      },
                      child: const Text(
                        '追加',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
