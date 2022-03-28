import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:proyecto_final_bases/app/utils/utils.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.darkBlue,
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Bienvenido al módiulo de administración de los Teatros UD',
              style: TextStyle(
                color: Palette.darkBlue,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            Container(
                height: 550,
                width: 550,
                child: Image.asset(
                  imageReferences.backgroundLogin,
                )

                // Image.network(controller.currentCategory.imageUrl!),
                ),
          ],
        ),
      ),
    );
  }
}
