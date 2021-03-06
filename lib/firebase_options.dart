// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA9P66z94Y5BwhQl3afU8x1comtb1FWGE0',
    appId: '1:562482690615:web:d04a4b3aaabfb3d710ddb2',
    messagingSenderId: '562482690615',
    projectId: 'appledcontroller',
    authDomain: 'appledcontroller.firebaseapp.com',
    databaseURL: 'https://appledcontroller-default-rtdb.firebaseio.com',
    storageBucket: 'appledcontroller.appspot.com',
    measurementId: 'G-1C5VJ1Z6WE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDYv2l2hRWCCDrCwfMcatiROEU_wSWnTLs',
    appId: '1:562482690615:android:5085738f200000cb10ddb2',
    messagingSenderId: '562482690615',
    projectId: 'appledcontroller',
    databaseURL: 'https://appledcontroller-default-rtdb.firebaseio.com',
    storageBucket: 'appledcontroller.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCP8edc76h45S6y_W-MpfyQqbn_jbRZZoY',
    appId: '1:562482690615:ios:1c6f2591b8656f9e10ddb2',
    messagingSenderId: '562482690615',
    projectId: 'appledcontroller',
    databaseURL: 'https://appledcontroller-default-rtdb.firebaseio.com',
    storageBucket: 'appledcontroller.appspot.com',
    iosClientId: '562482690615-81re7la0befd6o8990l102v1qbvrj983.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterLedController',
  );
}
