import 'package:get/get.dart';

class Student {
  String? name;
  RxBool? isSelected = false.obs;
  
  Student({
    this.name,
    this.isSelected,
  });
}
