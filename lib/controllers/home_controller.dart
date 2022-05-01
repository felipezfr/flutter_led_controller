import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomeController {
  HomeController() {
    initDb();
  }

  ValueNotifier<Color> pickerColor =
      ValueNotifier<Color>(const Color(0xFF26B6CF));

  late final DatabaseReference _dbRef;
  late StreamSubscription<DatabaseEvent> colorSubscription;

  void initDb() async {
    _dbRef = FirebaseDatabase.instance.ref("users/felipe2/quarto");

    try {
      final _colorSnapshot = await _dbRef.get();

      var color = _colorSnapshot.value as Map;
      pickerColor.value = Color.fromRGBO(
        color["r"]!,
        color["g"]!,
        color["b"]!,
        color["o"] * 1.0,
      );
    } catch (e) {
      debugPrint(e.toString());
    }

    colorSubscription = _dbRef.onValue.listen((DatabaseEvent event) {
      var color = event.snapshot.value as Map;

      pickerColor.value = Color.fromRGBO(
        color["r"]!,
        color["g"]!,
        color["b"]!,
        color["o"] * 1.0,
      );
    });
  }

  void changeColor(Color color) async {
    _dbRef.set({
      "r": color.red,
      "g": color.green,
      "b": color.blue,
      "o": color.opacity,
    });
  }
}
