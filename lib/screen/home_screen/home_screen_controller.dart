import 'dart:async';
import 'package:get/get.dart';
import 'dart:math' as math;

import '../add_screen/add_screen.dart';

class HomeScreenController extends GetxController {
  StreamController<int> streamController = StreamController<int>();
  final item = 0.obs;
  final random = math.Random();
  final resultText = 'aaasss'.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void onTap() {
    //乱数を出す。
    var n = random.nextInt(3);

    //乱数の値のリストの文字を探していれる。

    //ルーレットで値を入れる
    streamController.add(n);
  }

  void onTapAddScreen() {
    Get.to(() => const AddScreen());
  }
}
