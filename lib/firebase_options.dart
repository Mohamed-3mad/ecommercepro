// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBDCLCDh09Gys0phAJrx9beER7W9IzfAFY',
    appId: '1:456663317041:web:771f13e5253e2473167310',
    messagingSenderId: '456663317041',
    projectId: 'ecommerceapp-be23f',
    authDomain: 'ecommerceapp-be23f.firebaseapp.com',
    storageBucket: 'ecommerceapp-be23f.firebasestorage.app',
    measurementId: 'G-T9DSP2KRJP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDmJSx4tzwONv0qYza11QE5uWhTe30D-NQ',
    appId: '1:456663317041:android:89168fa22af68f56167310',
    messagingSenderId: '456663317041',
    projectId: 'ecommerceapp-be23f',
    storageBucket: 'ecommerceapp-be23f.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCdn_C5araup_imjjSTIyKVcM3lR7RMw0k',
    appId: '1:456663317041:ios:d19e0790aa2dedce167310',
    messagingSenderId: '456663317041',
    projectId: 'ecommerceapp-be23f',
    storageBucket: 'ecommerceapp-be23f.firebasestorage.app',
    androidClientId:
        '456663317041-dqnbfvn4ejosea1nlj28nt1a198vibtq.apps.googleusercontent.com',
    iosClientId:
        '456663317041-j7mj8g36ufuaa96a07k7hn6pd8vadp5b.apps.googleusercontent.com',
    iosBundleId: 'com.example.fruitmarket',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCdn_C5araup_imjjSTIyKVcM3lR7RMw0k',
    appId: '1:456663317041:ios:d19e0790aa2dedce167310',
    messagingSenderId: '456663317041',
    projectId: 'ecommerceapp-be23f',
    storageBucket: 'ecommerceapp-be23f.firebasestorage.app',
    androidClientId:
        '456663317041-dqnbfvn4ejosea1nlj28nt1a198vibtq.apps.googleusercontent.com',
    iosClientId:
        '456663317041-j7mj8g36ufuaa96a07k7hn6pd8vadp5b.apps.googleusercontent.com',
    iosBundleId: 'com.example.fruitmarket',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBDCLCDh09Gys0phAJrx9beER7W9IzfAFY',
    appId: '1:456663317041:web:c55fde847afe7a56167310',
    messagingSenderId: '456663317041',
    projectId: 'ecommerceapp-be23f',
    authDomain: 'ecommerceapp-be23f.firebaseapp.com',
    storageBucket: 'ecommerceapp-be23f.firebasestorage.app',
    measurementId: 'G-7VXZXHYY19',
  );
}
