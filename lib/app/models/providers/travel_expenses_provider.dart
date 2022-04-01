import 'dart:convert';
import 'package:http/http.dart' as http;
import '../travel_expenses_model.dart';

class TravelExpensesProvider {
  Future<TravelExpenses?> getTravel() async {
    final header = {
      "Content-Type": "application/json",
    };

    var response = await http.get(
      Uri.parse(
          "http://localhost:8089/ords/final_bases/travel_expenses/students"),
      headers: header,
    );

    if (response.statusCode == 200) {
      // print(response.body);
    } else {
      throw response.body;
    }
    return TravelExpenses.fromJson(json.decode(response.body));
  }
}

TravelExpensesProvider travelProvider = TravelExpensesProvider();
