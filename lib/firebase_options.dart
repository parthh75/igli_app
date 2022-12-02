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
    apiKey: 'AIzaSyCXcFpzwQ3gePZHdYnhjdqB8D1eCiEbeTc',
    appId: '1:536331531815:web:39eb694c5efb5b5df10002',
    messagingSenderId: '536331531815',
    projectId: 'iglifinancial-730f4',
    authDomain: 'iglifinancial-730f4.firebaseapp.com',
    storageBucket: 'iglifinancial-730f4.appspot.com',
    measurementId: 'G-1110WQ252Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCCuyIBtSa-D2BAeH-Yb7NoJ56fXb2c6y8',
    appId: '1:536331531815:android:74f9ff797c207329f10002',
    messagingSenderId: '536331531815',
    projectId: 'iglifinancial-730f4',
    storageBucket: 'iglifinancial-730f4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCdQIgmuY4kTssXOPK6pqZlHjlVeTvjZ_k',
    appId: '1:536331531815:ios:620e95e5c7123ffdf10002',
    messagingSenderId: '536331531815',
    projectId: 'iglifinancial-730f4',
    storageBucket: 'iglifinancial-730f4.appspot.com',
    iosClientId: '536331531815-d8d92mbu2ns6csm1tj62apbsl5bb2u17.apps.googleusercontent.com',
    iosBundleId: 'com.example.igliFinancial',
  );
}
