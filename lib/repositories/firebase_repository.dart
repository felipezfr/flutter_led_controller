import 'package:flutter/material.dart';

abstract class FirebasRepository {
  Future getColor();

  Color? colorSubscription();

  void setColor(Color color);
}
