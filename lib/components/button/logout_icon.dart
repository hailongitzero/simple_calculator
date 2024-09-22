import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_calculator/controllers/login/login.dart';
import 'package:get/get.dart';

class LogoutIconButton extends StatelessWidget {
  LogoutIconButton({super.key});
  final LoginController loginController = Get.put(LoginController());

  Widget _buildItem() {
    return IconButton(
      icon: const Icon(CupertinoIcons.person_alt_circle_fill),
      iconSize: 30,
      onPressed: () => {
        loginController.logout(),
      },
    );
  }

  @override
  Widget build(context) {
    return _buildItem();
  }
}
