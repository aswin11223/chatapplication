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
    apiKey: 'AIzaSyCO93q85GzILWmkC55OJc6AgHu5GzM9An0',
    appId: '1:429457227793:web:f22e99bee7183f1d7831b0',
    messagingSenderId: '429457227793',
    projectId: 'chatapplicatiion-1afd9',
    authDomain: 'chatapplicatiion-1afd9.firebaseapp.com',
    storageBucket: 'chatapplicatiion-1afd9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyARzeHAf3vH9H-bPBT1ALFwpaTn2FHgXHU',
    appId: '1:429457227793:android:045b765a8f4237717831b0',
    messagingSenderId: '429457227793',
    projectId: 'chatapplicatiion-1afd9',
    storageBucket: 'chatapplicatiion-1afd9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBk8XlNIllD8jxoR-TqgHbvU_k76QYr69Y',
    appId: '1:429457227793:ios:cd4a38f2fc84c3587831b0',
    messagingSenderId: '429457227793',
    projectId: 'chatapplicatiion-1afd9',
    storageBucket: 'chatapplicatiion-1afd9.appspot.com',
    iosBundleId: 'com.example.flutterChatapplication19',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBk8XlNIllD8jxoR-TqgHbvU_k76QYr69Y',
    appId: '1:429457227793:ios:cd4a38f2fc84c3587831b0',
    messagingSenderId: '429457227793',
    projectId: 'chatapplicatiion-1afd9',
    storageBucket: 'chatapplicatiion-1afd9.appspot.com',
    iosBundleId: 'com.example.flutterChatapplication19',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCO93q85GzILWmkC55OJc6AgHu5GzM9An0',
    appId: '1:429457227793:web:576d1de5aea312497831b0',
    messagingSenderId: '429457227793',
    projectId: 'chatapplicatiion-1afd9',
    authDomain: 'chatapplicatiion-1afd9.firebaseapp.com',
    storageBucket: 'chatapplicatiion-1afd9.appspot.com',
  );
}
