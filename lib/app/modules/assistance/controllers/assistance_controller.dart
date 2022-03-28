import 'package:get/get.dart';
import 'package:proyecto_final_bases/app/models/student.dart';

class AssistanceController extends GetxController {
  RxBool condition = true.obs;
  RxBool isLoading = false.obs;
  RxBool isActive = false.obs;
  RxBool firstPlay = true.obs;
  List<Student> students = [
    Student(name: 'Santiago', isSelected: false.obs),
    Student(name: 'Juan', isSelected: false.obs),
    Student(name: 'Camilo', isSelected: false.obs),
    Student(name: 'Laura', isSelected: false.obs),
    Student(name: 'María', isSelected: false.obs),
    Student(name: 'Valentina', isSelected: false.obs),
    Student(name: 'Caterina', isSelected: false.obs),
    Student(name: 'Giovanni', isSelected: false.obs),
    Student(name: 'Santiago1', isSelected: false.obs),
    Student(name: 'Santiago2', isSelected: false.obs),
    Student(name: 'Santiago3', isSelected: false.obs),
    Student(name: 'Santiago4', isSelected: false.obs),
    Student(name: 'Santiago5', isSelected: false.obs),
  ];
  List<Student> selectedStudents = [];

  @override
  void onInit() {
    super.onInit();
  }

  choosePlay(bool isFirst) {
    firstPlay.value = isFirst ? true : false;
    isActive.value= isFirst ? false : true;
  }

  onChanged(int position) {
    isLoading.value = true;
    if (students[position].isSelected!.value) {
      selectedStudents.remove(students[position]);
      students[position].isSelected!.value = false;
      isLoading.value = false;
    } else {
      selectedStudents.add(students[position]);
      students[position].isSelected!.value = true;
      isLoading.value = false;
    }
  }
}
