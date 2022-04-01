import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:proyecto_final_bases/app/models/empleado_model.dart';
import 'package:proyecto_final_bases/app/models/employee_model.dart';
import 'package:proyecto_final_bases/app/models/providers/empleado_provider.dart';
import 'package:proyecto_final_bases/app/routes/app_pages.dart';
import 'package:proyecto_final_bases/app/services/auth_service.dart';
import 'package:proyecto_final_bases/app/widgets/snackbars.dart';

import '../../../../models/providers/employee_provider.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKeyLogin = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxBool visiblePassword = false.obs;
  Empleado? empleados = Empleado();
  Employee? globalUser = Employee();

  @override
  void onInit() {
    getEmpleados();
    super.onInit();
  }

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
             globalUser = await employeeProvider.getEmpleado(emailController.text.trim());
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

  getEmpleados() async {
    empleados = await empleadoProvider.getEmpleados();
  }

  goToRegister() {
    Get.toNamed(Routes.REGISTER);
  }
}
