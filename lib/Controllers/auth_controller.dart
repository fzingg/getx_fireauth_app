import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getx_fireauth_app/Constants/firebase_constants.dart';

import '../Screens/home.dart';
import '../Screens/login.dart';


class AuthController extends GetxController {
  static AuthController authInstance = Get.find();
  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if(user != null) {
      // user is logged in
      Get.offAll(() => const Home());
    } else {
      // user is null as in user is not available or not logged in
      Get.offAll(() => Login());
    }
  }

  void register(String email, String password) {
    try {
      auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
    catch (e) {
      print(e.toString());
    }
  }


  void login(String email, String password) {
    try {
      auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
    catch (e) {
      print(e.toString());
    }
  }

  void signOut() {
    try {
      auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }


}