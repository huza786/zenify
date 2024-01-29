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
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA7zOY9XIUaAx_cN2az59JBc-JtPru3sJQ',
    appId: '1:703974786186:web:e603863f4f5f501ef41973',
    messagingSenderId: '703974786186',
    projectId: 'zenify-786',
    authDomain: 'zenify-786.firebaseapp.com',
    storageBucket: 'zenify-786.appspot.com',
    measurementId: 'G-KP17SPYLM8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyADLKGKrQPGYFNXuhw97chfOEJjiiT4jcE',
    appId: '1:703974786186:android:6d85df314663a298f41973',
    messagingSenderId: '703974786186',
    projectId: 'zenify-786',
    storageBucket: 'zenify-786.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCAx5wRocF06PLkYUd5nYUTnbScC2AwnlM',
    appId: '1:703974786186:ios:62dd1592c7c7db8bf41973',
    messagingSenderId: '703974786186',
    projectId: 'zenify-786',
    storageBucket: 'zenify-786.appspot.com',
    iosBundleId: 'com.example.zenify',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCAx5wRocF06PLkYUd5nYUTnbScC2AwnlM',
    appId: '1:703974786186:ios:9e12b202e5c88103f41973',
    messagingSenderId: '703974786186',
    projectId: 'zenify-786',
    storageBucket: 'zenify-786.appspot.com',
    iosBundleId: 'com.example.zenify.RunnerTests',
  );
}