import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBN3g_S7-L8PPc1H0d2wxiCyGPCR8qlEfk",
            authDomain: "gold-sites.firebaseapp.com",
            projectId: "gold-sites",
            storageBucket: "gold-sites.firebasestorage.app",
            messagingSenderId: "617173431700",
            appId: "1:617173431700:web:af9876b3a57d78aaa98b81",
            measurementId: "G-YTYKFYB2FJ"));
  } else {
    await Firebase.initializeApp();
  }
}
