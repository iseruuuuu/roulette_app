import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:roulette_app/model/todo.dart';
import 'package:roulette_app/screen/add_screen/add_screen_controller.dart';
import 'package:roulette_app/screen/roulette_screen/roulette_screen.dart';
import 'dart:math' as math;
import '../add_screen/add_screen.dart';

class RouletteScreenController extends GetxController {
  StreamController<int> streamController = StreamController<int>();
  final item = 0.obs;
  final random = math.Random();
  //後でいれる
  final resultText = ''.obs;
  final AudioCache _player = AudioCache();

  @override
  void onInit() {
    super.onInit();
  }

  void onTap() {
    //乱数を出す。
    var n = random.nextInt(100);
    //乱数の値のリストの文字を探していれる。
    //print(_todos[1].description);
    //効果音を入れたい
    _player.play('drum_sound.mp3');
    //ルーレットで値を入れる
    streamController.add(n);
  }

  void onTapAddScreen() {
    Get.back();
  }
}
