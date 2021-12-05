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
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      body:
          //TODO 登録した時のlengthを後で入れる (一応できているけど、表示用に載せている)
          (controller.todos.length == 0)
              //(controller.todos.length != 0)
              ? Center(
                  child: Column(
                    children: [
                      const Spacer(),
                      Text(
                        '結果 : ${controller.resultText.value} ',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      FortuneBar(
                          height: 130,
                          animateFirst: false,
                          duration: const Duration(seconds: 3),
                          selected: controller.streamController.stream,
                          items: [
                            //for (var index in controller.items)
                            for (var index in controller.items)
                              FortuneItem(
                                child: RouletteText(
                                  text: index,
                                  fontSize: 20,
                                ),
                              ),
                            //TODO ここの値も変わる
                          ]),
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
                              'データをセット',
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
