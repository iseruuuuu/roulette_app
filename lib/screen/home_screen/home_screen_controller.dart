import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../add_screen/add_screen.dart';

class HomeScreenController extends GetxController {
  StreamController<int> streamController = StreamController<int>();
  final item = 0.obs;
  final random = math.Random();
  final resultText = 'aaasss'.obs;

  // AudioCache audioCache = AudioCache();
  // AudioPlayer advancedPlayer = AudioPlayer();
  // String? localFilePath;
  // String? localAudioCacheURI;
  //
  // static const SOUND_DATA_UP = 'drum_sound.mp3';

  // final AudioCache _cache = AudioCache(
  //   fixedPlayer: AudioPlayer(),
  // );

  final AudioCache _player = AudioCache();

  final items = <String>[
    'Grogu',
    'Mace Windu',
    'Obi-Wan Kenobi',
    'Han Solo',
    'Luke Skywalker',
    'Darth Vader',
    'Yoda',
    'Ahsoka Tano',
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void onTap() {
    //乱数を出す。
    var n = random.nextInt(3);

    //乱数の値のリストの文字を探していれる。

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
