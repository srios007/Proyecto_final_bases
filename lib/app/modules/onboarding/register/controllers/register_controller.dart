import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:proyecto_final_bases/app/models/empleado_model.dart';
import 'package:proyecto_final_bases/app/models/providers/empleado_provider.dart';
import 'package:proyecto_final_bases/app/routes/app_pages.dart';
import 'package:proyecto_final_bases/app/services/auth_service.dart';
import 'package:proyecto_final_bases/app/widgets/snackbars.dart';
import 'package:proyecto_final_bases/app/widgets/yellow_button.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  RxBool isLoading = false.obs;
  final key = GlobalKey<FormState>();
  Empleado? empleado = Empleado();

  @override
  void onInit() {
    getEmpleados();
    super.onInit();
  }

  String? validteId(String? _) {
    if (idController.text.isEmpty) {
      return 'Por favor, rellena este campo';
    } else if (idController.text.length < 6) {
      return 'Por favor, pon tu documento completo';
    } else {
      return null;
    }
  }

  register() async {
    for (var element in empleado!.items!) {
      if (element.correoempleado == emailController.text) {
        Get.defaultDialog(
          title: 'Error',
          content: Column(
            children: [
              Text('El empleado ya existe'),
              const SizedBox(height: 20),
              YellowButton(
                height: 30,
                width: 200,
                buttonText: 'Volver',
                isLoading: false.obs,
                onPressed: Get.back,
                isActive: true.obs,
              ),
            ],
          ),
        );
        return null;
      }
    }

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
          //TODO: función de Oracle

          Get.offAllNamed(
            Routes.HOME,
            // arguments: {
            //   'user': q1Controller.user,
            // },
          );
        }
        isLoading.value = false;
      } catch (e) {
        print(e.toString());
        isLoading.value = false;
      }
    }
  }

  getEmpleados() async {
    empleado = await empleadoProvider.getEmpleados();
  }

  goToLogin() {
    Get.toNamed(Routes.LOGIN);
  }
}
