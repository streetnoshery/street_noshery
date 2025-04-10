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
    apiKey: 'AIzaSyAf6_nhfIvkEL8KAiNSjAS_hUz1G8Ilvq0',
    appId: '1:838601906801:web:0379e0f53a720f97da59d0',
    messagingSenderId: '838601906801',
    projectId: 'street-noshery',
    authDomain: 'street-noshery.firebaseapp.com',
    storageBucket: 'street-noshery.firebasestorage.app',
    measurementId: 'G-L72PCGF0DL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBEjlobUk-hur2ysLsHy6NDktYWz_17_Yo',
    appId: '1:838601906801:android:c01654af71e3292bda59d0',
    messagingSenderId: '838601906801',
    projectId: 'street-noshery',
    storageBucket: 'street-noshery.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyClx3zwHsqXxfaK0J14madEkyRJzlL6gHs',
    appId: '1:838601906801:ios:a1514986e02d25ebda59d0',
    messagingSenderId: '838601906801',
    projectId: 'street-noshery',
    storageBucket: 'street-noshery.firebasestorage.app',
    iosBundleId: 'com.example.streetNoshery',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyClx3zwHsqXxfaK0J14madEkyRJzlL6gHs',
    appId: '1:838601906801:ios:a1514986e02d25ebda59d0',
    messagingSenderId: '838601906801',
    projectId: 'street-noshery',
    storageBucket: 'street-noshery.firebasestorage.app',
    iosBundleId: 'com.example.streetNoshery',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAf6_nhfIvkEL8KAiNSjAS_hUz1G8Ilvq0',
    appId: '1:838601906801:web:86f89863691dfee5da59d0',
    messagingSenderId: '838601906801',
    projectId: 'street-noshery',
    authDomain: 'street-noshery.firebaseapp.com',
    storageBucket: 'street-noshery.firebasestorage.app',
    measurementId: 'G-RRQ5L1M6QV',
  );
}
