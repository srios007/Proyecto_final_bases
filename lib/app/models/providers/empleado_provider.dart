import 'package:proyecto_final_bases/app/utils/utils.dart';
import '../empleado_model.dart';
import 'package:http/http.dart' as http;

class EmpleadoProvider {
  Future<Empleado?> getEmpleados() async {
    // final header = {
    //   "Content-Type": "application/json",
    // };

    // var response = await http.post(
    //   Uri.parse("http://localhost:8089/ords/final_bases/register/empleados"),
    //   headers: header,
    // );

    // if (response.statusCode == 200) {
    //   print(response.body);
    // } else {
    //   throw response.body;
    // }
    return Empleado.fromJson(constants.login);
  }
}

EmpleadoProvider empleadoProvider = EmpleadoProvider();
