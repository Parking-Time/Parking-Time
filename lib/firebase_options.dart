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
    apiKey: 'AIzaSyAn_cys4Fcjif3bKdeJKn5AxO11NTQOZ58',
    appId: '1:514558038790:web:ac47658314baf5cd07c487',
    messagingSenderId: '514558038790',
    projectId: 'parking-time-34690',
    authDomain: 'parking-time-34690.firebaseapp.com',
    storageBucket: 'parking-time-34690.appspot.com',
    measurementId: 'G-CH4ZM6Z067',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAB5LoFm4w-R-9oE4TVajHxBI8WwvIFV5g',
    appId: '1:514558038790:android:6f9f1b90a7035fa907c487',
    messagingSenderId: '514558038790',
    projectId: 'parking-time-34690',
    storageBucket: 'parking-time-34690.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBq-KHJBIdd2TVMB7DBCknjBmQ3bGZoJDk',
    appId: '1:514558038790:ios:234bb2519670e4ec07c487',
    messagingSenderId: '514558038790',
    projectId: 'parking-time-34690',
    storageBucket: 'parking-time-34690.appspot.com',
    iosBundleId: 'com.parkingtime.parkingTime',
  );
}
