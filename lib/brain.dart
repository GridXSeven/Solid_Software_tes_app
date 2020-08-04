import 'package:flutter/foundation.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class Brain extends ChangeNotifier {
  Color bgColor = Colors.white;
  Color textColor = Colors.black;
  bool screenCrashed = false;
  String centerText = "Hey there";
  int danceCounter = -1;
  String danceMan;

  List<String> danceManAnimation = [
    "(-_-)\n/()\\\n_||_",
    "(-0-)\n\\()/\n_||_",
    "(-+-)\n\\()/\n_||_",
    "(-+-)\n/()\\\n_||_"
  ];

  onScreenTap() {
    int randomEvent = Random().nextInt(100);
    changeColor();
    checkTextColor();
    if (randomEvent < 2) {
      crashScreen();
    } else if (randomEvent < 5) {
      fixScreen();
    }
    checkDance(randomEvent, 30);
    notifyListeners();
  }

  void checkDance(int random, int chance) {
    if (random < chance) {
      startDance();
    }
    if (danceCounter >= danceManAnimation.length - 1) {
      stopDance();
    }
    if (danceCounter >= 0) {
      dance();
    }
  }

  void startDance() {
    danceCounter = 0;
  }

  void dance() {
    danceCounter++;
    danceMan = danceManAnimation[danceCounter];
  }

  void stopDance() {
    danceCounter = -1;
  }

  void crashScreen() {
    if (!screenCrashed) {
      screenCrashed = true;
    }
  }

  void fixScreen() {
    if (screenCrashed) {
      screenCrashed = false;
    }
  }

  void changeColor() {
    bgColor = randomColor();
  }

  void checkTextColor() {
    if (bgColor.red < 124 &&
        bgColor.green < 124 &&
        bgColor.blue < 124 &&
        bgColor.opacity > 0.5) {
      textColor = Colors.white;
    } else {
      textColor = Colors.black;
    }
  }

  Color randomColor() {
    return Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256),
        Random().nextInt(256));
  }
}
