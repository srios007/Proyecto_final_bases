import 'package:get/get.dart';
import 'package:proyecto_final_bases/app/utils/utils.dart';

import '../travel_expenses_model.dart';

class TravelExpensesProvider {
  Future<TravelExpenses?> getTravel() async {
    // final header = {
    //   "Content-Type": "application/json",
    // };

    // var response = await http.post(
    //   Uri.parse("http://localhost:8089/ords/final_bases/travel_expenses/students"),
    //   headers: header,
    // );

    // if (response.statusCode == 200) {
    //   print(response.body);
    // } else {
    //   throw response.body;
    // }
    return TravelExpenses.fromJson(constants.travelExpenses);
  }
}

TravelExpensesProvider travelProvider = TravelExpensesProvider();
