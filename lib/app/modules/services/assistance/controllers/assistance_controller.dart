import 'package:get/get.dart';
import 'package:proyecto_final_bases/app/models/estudiante_model.dart';
import 'package:proyecto_final_bases/app/models/student.dart';
import 'package:proyecto_final_bases/app/modules/home/controllers/home_controller.dart';

class AssistanceController extends GetxController {
  RxBool condition = true.obs;
  RxBool isLoading = false.obs;
  RxBool isActive = false.obs;
  RxBool firstPlay = true.obs;
  HomeController homeController = Get.find();
 List<Items> selectedStudents = [];

  @override
  void onInit() {
    super.onInit();
  }

  choosePlay(bool isFirst) {
    firstPlay.value = isFirst ? true : false;
    isActive.value = isFirst ? false : true;
  }

  onChanged(int position) {
    isLoading.value = true;
    if (homeController.estudiante!.items![position].isSelected!.value) {
      selectedStudents.remove(homeController.estudiante!.items![position]);
      homeController.estudiante!.items![position].isSelected!.value = false;
      isLoading.value = false;
    } else {
      selectedStudents.add(homeController.estudiante!.items![position]);
      homeController.estudiante!.items![position].isSelected!.value = true;
      isLoading.value = false;
    }
  }
}
