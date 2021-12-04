import 'dart:async';
import 'package:get/get.dart';
import 'dart:math' as math;

import '../add_screen/add_screen.dart';

class HomeScreenController extends GetxController {
  StreamController<int> streamController = StreamController<int>();
  final item = 0.obs;
  final random = math.Random();

  @override
  void onInit() {
    super.onInit();
  }

  void onTap() {
    var n = random.nextInt(3);
    streamController.add(n);
  }

  void onTapAddScreen() {
    Get.to(() => const AddScreen());
  }
}
