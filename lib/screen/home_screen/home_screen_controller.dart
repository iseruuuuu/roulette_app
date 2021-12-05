import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:roulette_app/model/todo.dart';
import 'dart:math' as math;
import '../add_screen/add_screen.dart';

class HomeScreenController extends GetxController {
  StreamController<int> streamController = StreamController<int>();
  final item = 0.obs;
  final random = math.Random();
  final resultText = 'aaasss'.obs;

  final AudioCache _player = AudioCache();

  final items = <String>[
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
  ].obs;

  final _todos = <Todo>[].obs;

  List<Todo> get todos => _todos;

  @override
  void onInit() {
    super.onInit();

    print(todos.length);
  }

  void onTap() {
    print(todos.length);
    //乱数を出す。
    var n = random.nextInt(6);

    //乱数の値のリストの文字を探していれる。

    //print(_todos[1].description)

    //効果音を入れたい
    _player.play('drum_sound.mp3');
    //ルーレットで値を入れる
    streamController.add(n);

    //決まったら音がなりたい
  }

  void onTapAddScreen() {
    Get.to(() => const AddScreen());
  }
}
