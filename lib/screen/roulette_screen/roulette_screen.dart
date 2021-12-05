import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:roulette_app/component/roulette_button.dart';
import 'package:roulette_app/component/roulette_button_reset.dart';
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
    final controller = Get.put(RouletteScreenController(listItem: rouletteItem),
        tag: rouletteItem[0].description);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: (rouletteItem.isNotEmpty)
          ? Center(
              child: Column(
                children: [
                  const Spacer(),
                  Obx(
                    () => RouletteText(
                      text: '結果 : ${controller.resultText.value}',
                      fontSize: 30,
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
                            fontSize: 20,
                          ),
                        ),
                    ],
                  ),
                  const Spacer(),
                  Obx(() => RouletteButton(
                      onTap: controller.isTap.value ? controller.onTap : null,
                    ),
                  ),
                  const Spacer(),
                  RouletteButtonReset(onTap: controller.onTapAddScreen),
                ],
              ),
            )
          : Container(),
    );
  }
}
