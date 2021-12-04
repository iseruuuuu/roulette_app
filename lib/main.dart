import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:roulette_app/screen/home_screen/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // TODO:SharedPreferencesの保存データを読み込んでここに設定
      themeMode: ThemeMode.system,
      // TODO:SharedPreferencesの保存データを読み込んでここに設定
      locale: null,
      home: HomeScreen(),
    );
  }
}
