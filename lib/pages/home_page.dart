import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_led_controller/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController();

  @override
  void dispose() {
    _controller.colorSubscription.cancel();
    super.dispose();
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
              child: ValueListenableBuilder<Color>(
                valueListenable: _controller.pickerColor,
                builder: (context, value, child) => ColorPicker(
                  paletteType: PaletteType.hueWheel,
                  pickerColor: _controller.pickerColor.value,
                  onColorChanged: _controller.changeColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
