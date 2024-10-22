import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCi258wICOOvSqnuKAMzoO1Zko8LyUgaU8",
            authDomain: "walkpointuri.firebaseapp.com",
            projectId: "walkpointuri",
            storageBucket: "walkpointuri.appspot.com",
            messagingSenderId: "929360659052",
            appId: "1:929360659052:web:1a54af75bf00587c80ce49"));
  } else {
    await Firebase.initializeApp();
  }
}
