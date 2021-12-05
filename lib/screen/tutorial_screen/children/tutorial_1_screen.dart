import 'package:flutter/material.dart';

class Tutorial1Screen extends StatelessWidget {
  const Tutorial1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: const [
            Text(
              'チュートリアル①',
              style: TextStyle(
                color: Colors.red,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),

            //TODO Gifを追加する（入力する姿）
          ],
        ),
      ),
    );
  }
}
