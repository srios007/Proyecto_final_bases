import 'dart:convert';
import '../estudiante_model.dart';
import 'package:http/http.dart' as http;

class EstudianteProvider {
  Future<Estudiante?> getEstudiante() async {
    final header = {
      "Content-Type": "application/json",
    };

    var response = await http.get(
      Uri.parse("http://localhost:8089/ords/final_bases/assistence/students/"),
      headers: header,
    );

    if (response.statusCode == 200) {
      // print(response.body);
    } else {
      throw response.body;
    }
    return Estudiante.fromJson(json.decode(response.body));
  }
}

EstudianteProvider estudianteProvider = EstudianteProvider();
