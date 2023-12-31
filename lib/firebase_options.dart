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
    apiKey: 'AIzaSyB8P6gruWUpkosxkUlF3iOgJVfUiu-75E0',
    appId: '1:1001030481879:web:cb9708b3d5467ce25ebd92',
    messagingSenderId: '1001030481879',
    projectId: 'tiktok-ff984',
    authDomain: 'tiktok-ff984.firebaseapp.com',
    storageBucket: 'tiktok-ff984.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDzmFKRusQGhk6yqM1Hou2nFTCBFv5H8sM',
    appId: '1:1001030481879:android:6d16c8882a77fd175ebd92',
    messagingSenderId: '1001030481879',
    projectId: 'tiktok-ff984',
    storageBucket: 'tiktok-ff984.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAtSsUQxD0GmXQlft5nlvoNPcUmA_5fNfg',
    appId: '1:1001030481879:ios:3676eea8241e48e55ebd92',
    messagingSenderId: '1001030481879',
    projectId: 'tiktok-ff984',
    storageBucket: 'tiktok-ff984.appspot.com',
    iosClientId: '1001030481879-0e6houglj25sien1hkc41rj8g35gqriv.apps.googleusercontent.com',
    iosBundleId: 'com.example.tiktokClone',
  );
}
