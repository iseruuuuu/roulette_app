import 'package:flutter/material.dart';
import 'package:flutter_sliding_tutorial/flutter_sliding_tutorial.dart';
import 'package:roulette_app/screen/tutorial_screen/sliding_tutorial.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({
    Key? key,
  }) : super(key: key);

  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final ValueNotifier<double> notifier = ValueNotifier(0);
  int pageCount = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            SlidingTutorial(
              pageCount: pageCount,
              notifier: notifier,
            ),
            Align(
              alignment: const Alignment(0, 0.85),
              child: Container(
                width: double.infinity,
                height: 0.5,
                color: Colors.white,
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.94),
              child: SlidingIndicator(
                indicatorCount: pageCount,
                notifier: notifier,
                activeIndicator: const Icon(
                  Icons.analytics_outlined,
                  color: Colors.black,
                ),
                inActiveIndicator: const Icon(
                  Icons.analytics_outlined,
                  color: Colors.white,
                ),
                margin: 8,
                inactiveIndicatorSize: 25,
                activeIndicatorSize: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
