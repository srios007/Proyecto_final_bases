import 'package:get/get.dart';

import '../controllers/travel_expenses_detail_controller.dart';

class TravelExpensesDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TravelExpensesDetailController>(
      () => TravelExpensesDetailController(),
    );
  }
}
