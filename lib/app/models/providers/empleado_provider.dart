import 'dart:convert';
import '../empleado_model.dart';
import 'package:http/http.dart' as http;

class EmpleadoProvider {
  Future<Empleado?> getEmpleados() async {
    final header = {
      "Content-Type": "application/json",
    };

    var response = await http.get(
      Uri.parse("http://localhost:8089/ords/final_bases/register/empleados"),
      headers: header,
    );

    if (response.statusCode == 200) {
      // print(response.body);
    } else {
      throw response.body;
    }
    return Empleado.fromJson(json.decode(response.body));
  }
}

EmpleadoProvider empleadoProvider = EmpleadoProvider();
