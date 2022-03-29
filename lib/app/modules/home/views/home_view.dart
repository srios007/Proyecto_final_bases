import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_final_bases/app/utils/utils.dart';
import 'package:proyecto_final_bases/app/widgets/tab_bar_contents.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(),
      ),
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            child: Image.asset(
              imageReferences.backgroundLogin,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Container(
              width: Get.width,
              height: Get.height,
              color: Colors.black.withOpacity(0.8),
              // child: Image.asset(
              //   imageReferences.logo,
              // ),
              child: Column(
                children: [
                  TopBarContents(),
                  Container(
                    height: Get.height - 80,
                    width: Get.width,
                    color: Colors.white.withOpacity(0.6),
                    child: Column(
                      children: [
                        Spacer(),
                        Text(
                          'Bienvenido al Módulo de Administración de Teatros',
                          style: TextStyle(
                            fontSize: 48,
                            color: Palette.darkBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 500,
                          height: 500,
                          child: Image.asset(
                            imageReferences.home,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          'Te ayudaremos a administrarlos.',
                          style: TextStyle(
                            fontSize: 30,
                            color: Palette.darkBlue.withOpacity(0.7),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Prueba nuestras grandes funcionalidades',
                          style: TextStyle(
                            fontSize: 35,
                            color: Palette.darkBlue,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

