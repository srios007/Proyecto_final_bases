import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_final_bases/app/utils/utils.dart';
import 'package:proyecto_final_bases/app/widgets/email_input.dart';
import 'package:proyecto_final_bases/app/widgets/yellow_button.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
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
                  key: controller.formKeyLogin,
                  child: Column(
                    children: [
                      const Spacer(),
                      const SizedBox(height: 30),
                      Text(
                        '¡Inicia sesión!',
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
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80),
                        child: _PasswordInput(controller: controller),
                      ),
                      const SizedBox(height: 40),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: '¿No tienes una cuenta?  ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Regístrate',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = controller.goToRegister,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      YellowButton(
                        buttonText: 'Iniciar sesión',
                        isLoading: controller.isLoading,
                        onPressed: controller.login,
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

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder roundedTextField = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        width: 2,
        color: Palette.lightGray,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contraseña',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),
        Stack(
          children: [
            Container(
              height: 50,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Obx(
              () => Container(
                width: MediaQuery.of(context).size.width - 100,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    hintStyle: TextStyle(
                      color: Palette.darkBlue.withOpacity(0.4),
                      fontWeight: FontWeight.bold,
                    ),
                    helperText:
                        'Tu contaseña es el número de cédula que ingresaste al momento de tu registro',
                    helperStyle: TextStyle(
                      color: Colors.white,
                      
                    ),
                    enabledBorder: roundedTextField,
                    focusedBorder: roundedTextField,
                    errorBorder: roundedTextField,
                    focusedErrorBorder: roundedTextField,
                    suffixIcon: IconButton(
                      onPressed: controller.showPassword,
                      icon: controller.visiblePassword.value
                          ? const Icon(CupertinoIcons.eye,
                              color: Palette.darkBlue)
                          : const Icon(
                              CupertinoIcons.eye_slash,
                              color: Palette.darkBlue,
                            ),
                    ),
                  ),
                  validator: controller.validatePassword,
                  controller: controller.passwordController,
                  obscureText: !controller.visiblePassword.value,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
