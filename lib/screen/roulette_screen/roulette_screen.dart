import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:roulette_app/component/roulette_text.dart';
import 'package:roulette_app/model/todo.dart';
import 'package:roulette_app/screen/roulette_screen/roulette_screen_controller.dart';

class RouletteScreen extends StatelessWidget {
  const RouletteScreen({
    Key? key,
    required this.rouletteItem,
  }) : super(key: key);

  final List<Todo> rouletteItem;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RouletteScreenController(listItem: rouletteItem), tag: rouletteItem[0].description);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      body: (rouletteItem.isNotEmpty)
          ? Center(
              child: Column(
                children: [
                  const Spacer(),
                  Obx(() => Text(
                      '結果 : ${controller.resultText.value} ',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  FortuneBar(
                    height: 130,
                    animateFirst: false,
                    duration: const Duration(seconds: 3),
                    selected: controller.streamController.stream,
                    items: [
                      for (var index in rouletteItem)
                        FortuneItem(
                          child: RouletteText(
                            text: index.description,
                          ),
                        ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 7,
                    child: ElevatedButton(
                      onPressed: controller.onTap,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      child: const Text(
                        'Start',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: controller.onTapAddScreen,
                    child: Container(
                      color: Colors.grey,
                      width: double.infinity,
                      height: 60,
                      child: const Center(
                        child: Text(
                          'データをセットしなおす',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(),
    );
  }
}
