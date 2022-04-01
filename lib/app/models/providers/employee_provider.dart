import 'dart:convert';

import 'package:get/get.dart';

import '../employee_model.dart';
import 'package:http/http.dart' as http;


class EmployeeProvider  {
  Future<Employee?> getEmpleado(String correo) async {
    final header = {
      "Content-Type": "application/json",
    };

    var response = await http.get(
      Uri.parse("http://localhost:8089/ords/final_bases/register/empleado/$correo"),
      headers: header,
    );
      print(response.body);

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.body);

      throw response.body;
    }
    return Employee.fromJson(json.decode(response.body));
  }
}

EmployeeProvider employeeProvider = EmployeeProvider();

