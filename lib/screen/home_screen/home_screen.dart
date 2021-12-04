import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:roulette_app/component/roulette_text.dart';
import 'home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController(), tag: '');
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
      ),
      body:
          //TODO 登録した時のlengthを後で入れる
          (controller.item.value == 0)
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FortuneBar(
                        selected: controller.streamController.stream,
                        items: const [
                          FortuneItem(child: RouletteText(text: 'あああ')),
                          FortuneItem(child: RouletteText(text: 'いいい')),
                          FortuneItem(child: RouletteText(text: 'ううう')),
                        ],
                      ),
                      TextButton(
                        onPressed: controller.onTap,
                        child: const Text('Start'),
                      ),
                    ],
                  ),
                )
              : Container(),
    );
  }
}
