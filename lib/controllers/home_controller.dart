import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_led_controller/repositories/firebase_repository.dart';
import 'package:flutter_led_controller/repositories/firebase_repository_imp.dart';

class HomeController {
  final FirebasRepository _firebasRepository = FirebaseRepositoryImp(
    FirebaseDatabase.instance.ref("users/felipe2/quarto"),
  );

  HomeController() {
    init();
  }

  ValueNotifier<Color> pickerColor =
      ValueNotifier<Color>(const Color(0xFF26B6CF));

  void init() async {
    try {
      pickerColor.value = await _firebasRepository.getColor();
    } catch (e) {
      debugPrint(e.toString());
    }

    // _firebasRepository.colorSubscription();
  }

  void changeColor(Color color) async {
    _firebasRepository.setColor(color);
  }
}
