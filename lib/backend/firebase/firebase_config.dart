import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBYgEOOVga_5Uvgpad4dLfBRuUDOCueoc8",
            authDomain: "poultry-tty8nf.firebaseapp.com",
            projectId: "poultry-tty8nf",
            storageBucket: "poultry-tty8nf.appspot.com",
            messagingSenderId: "196338607791",
            appId: "1:196338607791:web:39097debe2b9c5f6b9565a"));
  } else {
    await Firebase.initializeApp();
  }
}
