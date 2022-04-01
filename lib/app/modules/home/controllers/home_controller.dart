import 'package:get/get.dart';
import 'package:proyecto_final_bases/app/models/estudiante_model.dart';
import 'package:proyecto_final_bases/app/models/providers/estudiante_provider.dart';
import 'package:proyecto_final_bases/app/models/travel_expenses_model.dart';
import 'package:proyecto_final_bases/app/modules/onboarding/login/controllers/login_controller.dart';

import '../../../models/providers/travel_expenses_provider.dart';

class HomeController extends GetxController {
  LoginController loginController = Get.find();
  Estudiante? estudiante = Estudiante();
  TravelExpenses? travel = TravelExpenses();

  final count = 0.obs;
  @override
  void onInit() {
    getEstudiantes();
    getTravel();
    super.onInit();
  }

  getEstudiantes() async {
    estudiante = await estudianteProvider.getEstudiante();
  }
   getTravel() async {
    travel = await travelProvider.getTravel();
  }
}
