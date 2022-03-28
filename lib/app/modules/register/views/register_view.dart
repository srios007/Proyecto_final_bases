import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:proyecto_final_bases/app/utils/utils.dart';
import 'package:proyecto_final_bases/app/widgets/yellow_button.dart';
import 'package:proyecto_final_bases/app/widgets/email_input.dart';
import 'package:proyecto_final_bases/app/widgets/normal_input.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
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
          Row(
            children: [
              Center(
                child: Container(
                  width: Get.width * 0.5,
                  height: Get.height,
                  color: Colors.white.withOpacity(0.9),
                  child: Image.asset(
                    imageReferences.logo,
                  ),
                ),
              ),
              Container(
                width: Get.width * 0.5,
                height: Get.height,
                color: Colors.black.withOpacity(0.6),
                child: Column(
                  children: [
                    const Spacer(),
                    const SizedBox(height: 30),
                    Text(
                      '¡Regístrate!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: LizitEmailInput(
                        title: 'Correo electrónico',
                        hintText: 'moduloTeatro@correo.com',
                        controller: controller.emailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NormalInput(
                            title: 'Nombre',
                            hintText: 'Santiago',
                            width: Get.width * 0.2,
                            controller: controller.emailController,
                          ),
                          NormalInput(
                            title: 'Apellido',
                            hintText: 'Caro',
                            width: Get.width * 0.2,
                            controller: controller.emailController,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NormalInput(
                            title: 'Documento',
                            hintText: '123456',
                            width: Get.width * 0.2,
                            controller: controller.emailController,
                          ),
                          NormalInput(
                            title: 'Celular',
                            hintText: '654321',
                            width: Get.width * 0.2,
                            controller: controller.emailController,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    YellowButton(
                      buttonText: 'Registrarme',
                      isLoading: false.obs,
                      onPressed: () {},
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
