import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:proyecto_final_bases/app/routes/app_pages.dart';
import 'package:proyecto_final_bases/app/services/auth_service.dart';
import 'package:proyecto_final_bases/app/widgets/snackbars.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKeyLogin = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxBool visiblePassword = false.obs;

  void showPassword() {
    visiblePassword.value
        ? visiblePassword.value = false
        : visiblePassword.value = true;
  }

  String? validatePassword(String? _) {
    if (passwordController.text.isEmpty) {
      return 'Por favor, rellena este campo';
    } else if (passwordController.text.length < 6) {
      return 'La longitud mínima es de 6 caracteres';
    } else {
      return null;
    }
  }

  login() async {
    if (formKeyLogin.currentState!.validate()) {
      isLoading.value = true;

      try {
        final response = await auth.signIn(
            email: emailController.text, password: passwordController.text);
        if (response is! String) {
          isLoading.value = false;
          Get.offAllNamed(
            Routes.HOME,
            // arguments: {'user': user},
          );
        } else {
          ModuleSnackBars.showErrorSnackBar(response);
          isLoading.value = false;
        }
      } catch (e) {
        e.toString();
      }
    }
  }

  // void recoverUser() {
  //   Get.toNamed(Routes.FORGOT_USER);
  // }

  // void recoverPassword() {
  //   Get.toNamed(Routes.FORGOT_PASSWORD);
  // }

  goToRegister() {
    Get.toNamed(Routes.REGISTER);
  }
}
