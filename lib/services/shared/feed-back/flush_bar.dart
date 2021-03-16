import 'package:flutter/material.dart';
import 'package:get/get.dart';

showFlushBar({
  @required String title,
  @required String message,
  Widget icon = const Icon(
    Icons.error_outline,
    color: Colors.red,
  ),
}) {
  Get.showSnackbar(
    GetBar(
      title: title,
      message: message,
      icon: icon,
      duration: Duration(seconds: 3),
    ),
  );
}
