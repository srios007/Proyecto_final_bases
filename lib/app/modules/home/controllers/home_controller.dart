import 'package:get/get.dart';
import 'package:proyecto_final_bases/app/models/estudiante_model.dart';
import 'package:proyecto_final_bases/app/models/providers/estudiante_provider.dart';
import 'package:proyecto_final_bases/app/models/providers/obra_provider.dart';
import 'package:proyecto_final_bases/app/models/travel_expenses_model.dart';
import 'package:proyecto_final_bases/app/modules/onboarding/login/controllers/login_controller.dart';

import '../../../models/obra_model.dart';
import '../../../models/providers/travel_expenses_provider.dart';

class HomeController extends GetxController {
  LoginController loginController = Get.find();
  Estudiante? estudiante = Estudiante();
  TravelExpenses? travel = TravelExpenses();
  Obra? obra = Obra();

  final count = 0.obs;
  @override
  void onInit() {
    getEstudiantes();
    getTravel();
    getObra();
    super.onInit();
  }

  getEstudiantes() async {
    estudiante = await estudianteProvider.getEstudiante();
  }

  getTravel() async {
    travel = await travelProvider.getTravel();
  }

  getObra() async {
    obra = await obraProvider.getObra();
  }
}
