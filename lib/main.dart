// ignore_for_file: unused_import, prefer_const_constructors

import 'package:boookaa/locale/mylocale.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'locale/transC.dart';
import 'screen/hellopage.dart';
import 'screen/homepage.dart';

SharedPreferences? sharedPreferences;

bool? isLogin;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    isLogin = false;
  } else {
    isLogin = true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    
    return GetMaterialApp(
      translations: MyLocale(),
      debugShowCheckedModeBanner: false,
      locale: controller.initLang,
      home: isLogin == false ? HelloPage() : HomePage(),
    );
  }
}
