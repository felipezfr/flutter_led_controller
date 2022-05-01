import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_led_controller/repositories/firebase_repository.dart';

class FirebaseRepositoryImp implements FirebasRepository {
  late final DatabaseReference _dbRef;
  FirebaseRepositoryImp(this._dbRef);

  late StreamSubscription<DatabaseEvent> _colorSubscription;

  @override
  Future<Color?> getColor() async {
    try {
      final _colorSnapshot = await _dbRef.get();

      var color = _colorSnapshot.value as Map;
      return Color.fromRGBO(
        color["r"]!,
        color["g"]!,
        color["b"]!,
        color["o"] * 1.0,
      );
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Color? colorSubscription() {
    Color? color;

    _colorSubscription = _dbRef.onValue.listen((DatabaseEvent event) {
      var colorEvent = event.snapshot.value as Map;

      color = Color.fromRGBO(
        colorEvent["r"]!,
        colorEvent["g"]!,
        colorEvent["b"]!,
        colorEvent["o"] * 1.0,
      );
    });

    return color;
  }

  @override
  void setColor(Color color) {
    _dbRef.set({
      "r": color.red,
      "g": color.green,
      "b": color.blue,
      "o": color.opacity,
    });
  }
}
