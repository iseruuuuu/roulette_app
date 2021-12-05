import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../../model/todo.dart';

class RouletteScreenController extends GetxController {
  StreamController<int> streamController = StreamController<int>();
  final item = 0.obs;
  final random = math.Random();
  final resultText = ''.obs;
  final AudioCache _player = AudioCache();
  final List<Todo> listItem;

  RouletteScreenController({
    required this.listItem,
  });

  void onTap() async {
    //乱数の値のリストの文字を探していれる。
    var n = random.nextInt(listItem.length);
    //効果音を入れる。
    _player.play('drum_sound.mp3');
    //ルーレットで値を入れる。
    streamController.add(n);
    //結果をテキストに反映する。
    await Future.delayed(const Duration(seconds: 3));
    resultText.value = listItem[n].description;
  }

  void onTapAddScreen() {
    Get.back();
  }
}
