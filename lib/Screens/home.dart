import 'package:flutter/material.dart';

import '../Controllers/auth_controller.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome !"),
        actions: [
          IconButton(
            onPressed: () {
              AuthController.authInstance.signOut();
            },
            icon: const Icon(Icons.power_off))
        ],
      ),
      body: const Center(
        child: Text("Home Page"),
      ),
    );
  }
}