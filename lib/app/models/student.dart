import 'package:get/get.dart';

class Student {
  String? name;
  String? section;
  int? hours;
  RxBool? isSelected = false.obs;
  
  Student({
    this.name,
    this.section,
    this.hours,
    this.isSelected,
  });
}
