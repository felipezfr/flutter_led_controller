import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Color _pickerColor = Color(0xFF26B6CF);
  // Color currentColor = Color(0xff443a49);

  late final DatabaseReference _dbRef;
  late StreamSubscription<DatabaseEvent> _colorSubscription;

  @override
  void initState() {
    super.initState();
    initDb();
  }

  void initDb() async {
    _dbRef = FirebaseDatabase.instance.ref("users/felipe2/quarto");

    try {
      final _colorSnapshot = await _dbRef.get();

      setState(() {
        var color = _colorSnapshot.value as Map;
        _pickerColor = Color.fromRGBO(
          color["r"]!,
          color["g"]!,
          color["b"]!,
          color["o"] * 1.0,
        );
      });
    } catch (e) {
      debugPrint(e.toString());
    }

    _colorSubscription = _dbRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        var color = event.snapshot.value as Map;

        _pickerColor = Color.fromRGBO(
          color["r"]!,
          color["g"]!,
          color["b"]!,
          color["o"] * 1.0,
        );
      });
    });
  }

  @override
  void dispose() {
    _colorSubscription.cancel();
    super.dispose();
  }

  void changeColor(Color color) async {
    _dbRef.set({
      "r": color.red,
      "g": color.green,
      "b": color.blue,
      "o": color.opacity,
    });
    // setState(
    //   () => _pickerColor = color.value,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Led Controller")),
      backgroundColor: Colors.white30,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ColorPicker(
                paletteType: PaletteType.hueWheel,
                pickerColor: _pickerColor,
                onColorChanged: changeColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
