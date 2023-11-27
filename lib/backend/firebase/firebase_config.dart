import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD7yIPlfh7faNw4WDheB_IMUFnuC2Dcd88",
            authDomain: "f3app-kxihby.firebaseapp.com",
            projectId: "f3app-kxihby",
            storageBucket: "f3app-kxihby.appspot.com",
            messagingSenderId: "58610559118",
            appId: "1:58610559118:web:088a3e7f957ed0779641df"));
  } else {
    await Firebase.initializeApp();
  }
}
