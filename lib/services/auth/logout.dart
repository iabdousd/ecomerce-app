import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rimlines/constants/auth/main.dart';
import 'package:rimlines/configs/memory_veriables.dart' as mv;
import 'package:rimlines/views/auth-views/login_page.dart';

detachMemoryVariables() {
  mv.jwtToken = null;
  mv.currentUser = null;
}

signOut({push: true}) async {
  final storage = new FlutterSecureStorage();
  await storage.delete(key: jwtKey);
  detachMemoryVariables();
  if (push)
    Navigator.of(Get.context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
}
