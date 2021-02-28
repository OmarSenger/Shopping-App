import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'file:///C:/Users/lenovo/IdeaProjects/shopping/lib/ui/products.dart';
import 'file:///C:/Users/lenovo/IdeaProjects/shopping/lib/ui/splash.dart';

  Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  var password = prefs.getString('password');
  print(email);
  print(password);
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: email == null ? SplashPage() : Products(),
  )
  );
}


