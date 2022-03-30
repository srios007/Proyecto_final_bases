import 'package:flutter/gestures.dart';
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
                child: Form(
                  key: controller.key,
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
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: LizitEmailInput(
                          title: 'Correo electrónico',
                          hintText: 'moduloTeatro@correo.com',
                          controller: controller.emailController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NormalInput(
                              title: 'Nombre',
                              hintText: 'Santiago',
                              width: Get.width * 0.2,
                              controller: controller.nameController,
                            ),
                            NormalInput(
                              title: 'Apellido',
                              hintText: 'Caro',
                              width: Get.width * 0.2,
                              controller: controller.lastNameController,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NormalInput(
                              title: 'Documento',
                              hintText: '10101010',
                              width: Get.width * 0.2,
                              controller: controller.idController,
                              validator: controller.validteId,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                            NormalInput(
                              title: 'Celular',
                              hintText: '3214567890',
                              width: Get.width * 0.2,
                              controller: controller.phoneNumberController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: '¿Ya tienes una cuenta?  ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Inicia sesión',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = controller.goToLogin,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      YellowButton(
                        buttonText: 'Registrarme',
                        isLoading: controller.isLoading,
                        onPressed: controller.register,
                        isActive: true.obs,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
