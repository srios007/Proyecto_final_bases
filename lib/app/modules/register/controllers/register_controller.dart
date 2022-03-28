import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:proyecto_final_bases/app/services/auth_service.dart';
import 'package:proyecto_final_bases/app/widgets/snackbars.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  RxBool isLoading = false.obs;
  final key = GlobalKey<FormState>();

  String? validteId(String? _) {
    if (idController.text.isEmpty) {
      return 'Por favor, rellena este campo';
    } else if (idController.text.length < 6) {
      return 'Por favor, pon tu documento completo';
    } else {
      return null;
    }
  }

  goToHome() async {
    if (key.currentState!.validate()) {
      try {
        isLoading.value = true;
        var signUpResult = await auth.signUp(
          email: emailController.text.trim(),
          password: idController.text.trim(),
        );
        if (signUpResult ==
            'There is an account already registered with this email.') {
          ModuleSnackBars.showErrorSnackBar(
              'Ya existe un usuario con este correo.');
          isLoading.value = false;
        } else if (signUpResult ==
            'Your email address appears to be malformed.') {
          ModuleSnackBars.showErrorSnackBar('Tu correo está mal escrito');
        } else if (signUpResult is String) {
          ModuleSnackBars.showErrorSnackBar(signUpResult);
          isLoading.value = false;
        } else {
          //TODO: funcioón de Oracle
          
          // Get.offAllNamed(Routes.SUCCESFULL_REGISTRATION, arguments: {
          //   'user': q1Controller.user,
          // });
        }
        isLoading.value = false;
      } catch (e) {
        print(e.toString());
        isLoading.value = false;
      }
    }
  }
}
