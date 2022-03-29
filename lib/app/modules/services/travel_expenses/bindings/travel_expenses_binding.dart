import 'package:get/get.dart';

import '../controllers/travel_expenses_controller.dart';

class TravelExpensesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TravelExpensesController>(
      () => TravelExpensesController(),
    );
  }
}
