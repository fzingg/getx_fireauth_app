import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_fireauth_app/Constants/firebase_constants.dart';
import 'package:getx_fireauth_app/Controllers/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  firebaseInitialization.then((value) {
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Center(
          child: CircularProgressIndicator()
      ),
    );
  }
}


