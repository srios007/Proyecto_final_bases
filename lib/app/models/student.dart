import 'package:get/get.dart';

class Student {
  String? id;
  String? email;
  String? name;
  String? section;
  String? period;
  String? play;
  int? hours;
  int? sessions;
  RxBool? isSelected = false.obs;

  Student({
    required this.id,
    required this.email,
    required this.name,
      this.play,
    required this.section,
    required this.period,
    required this.sessions,
    required this.hours,
     required this.isSelected,
  });
}
