import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'file:///C:/Users/lenovo/IdeaProjects/shopping/lib/ui/products.dart';
import 'file:///C:/Users/lenovo/IdeaProjects/shopping/lib/ui/splash.dart';

  Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  var password = prefs.getString('password');
  print(email);
  print(password);
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: email == null ? SplashPage() : Products()));
}

