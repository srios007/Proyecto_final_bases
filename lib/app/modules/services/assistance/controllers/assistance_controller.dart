import 'package:get/get.dart';
import 'package:proyecto_final_bases/app/models/student.dart';

class AssistanceController extends GetxController {
  RxBool condition = true.obs;
  RxBool isLoading = false.obs;
  RxBool isActive = false.obs;
  RxBool firstPlay = true.obs;
  List<Student> students = [
    Student(
      id: '1010',
      email: 'Santiago@gmail.com',
      name: 'Santiago Rios',
      section: 'Intro',
      period: '27-FEB-22 - 05-MAR-22',
      sessions: 2,
      hours: 2,
      isSelected: false.obs,
    ),
    Student(
      id: '2124',
      email: 'jorge@gmail.com',
      name: 'Jorge Bohórquez',
      section: 'Intermedio',
      period: '27-FEB-22 - 05-MAR-22',
      sessions: 3,
      hours: 1,
      isSelected: false.obs,
    ),
    Student(
      id: '3453',
      email: 'jmostosq@gmail.com',
      name: 'Juan Manuel Ostos',
      section: 'Final',
      period: '27-FEB-22 - 05-MAR-22',
      sessions: 4,
      hours: 3,
      isSelected: false.obs,
    ),
  ];
  List<Student> selectedStudents = [];

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
