import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBIot2pdC3i54KGQbHNlOPiKQo-_73JHhM",
            authDomain: "cervicare.firebaseapp.com",
            projectId: "cervicare",
            storageBucket: "cervicare.appspot.com",
            messagingSenderId: "174457591202",
            appId: "1:174457591202:web:dc6f9d71b47ae4a780cefb",
            measurementId: "G-9NTY52YR76"));
  } else {
    await Firebase.initializeApp();
  }
}
