import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCXsr36Csp_-zAfQP0XltCmG52sefowAO4",
            authDomain: "english-driver-cr4a35.firebaseapp.com",
            projectId: "english-driver-cr4a35",
            storageBucket: "english-driver-cr4a35.appspot.com",
            messagingSenderId: "129850748352",
            appId: "1:129850748352:web:853fb05b64a415db176c25"));
  } else {
    await Firebase.initializeApp();
  }
}
