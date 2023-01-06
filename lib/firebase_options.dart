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
    apiKey: 'AIzaSyD9P2KeNEL_U7pMgvmSuiy0EC5fF_3dUao',
    appId: '1:448017006997:web:91420be84bc60663deb69c',
    messagingSenderId: '448017006997',
    projectId: 'to-do-auth-c796b',
    authDomain: 'to-do-auth-c796b.firebaseapp.com',
    storageBucket: 'to-do-auth-c796b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDggzIcdWbIjx6Q_2Ra5vx-RidJ9EU0hBw',
    appId: '1:448017006997:android:de4c4e463efd7d21deb69c',
    messagingSenderId: '448017006997',
    projectId: 'to-do-auth-c796b',
    storageBucket: 'to-do-auth-c796b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAT62ekfgVMSnsVSozinYQ3idpySh7lcic',
    appId: '1:448017006997:ios:b7c440cdb1114cc8deb69c',
    messagingSenderId: '448017006997',
    projectId: 'to-do-auth-c796b',
    storageBucket: 'to-do-auth-c796b.appspot.com',
    iosClientId: '448017006997-vd2clm8qrl0hc22btkft8c2duc2tlrev.apps.googleusercontent.com',
    iosBundleId: 'com.goldeniroakaziy.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAT62ekfgVMSnsVSozinYQ3idpySh7lcic',
    appId: '1:448017006997:ios:b7c440cdb1114cc8deb69c',
    messagingSenderId: '448017006997',
    projectId: 'to-do-auth-c796b',
    storageBucket: 'to-do-auth-c796b.appspot.com',
    iosClientId: '448017006997-vd2clm8qrl0hc22btkft8c2duc2tlrev.apps.googleusercontent.com',
    iosBundleId: 'com.goldeniroakaziy.todo',
  );
}
