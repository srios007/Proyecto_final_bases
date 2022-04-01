import '../../utils/utils.dart';
import '../estudiante_model.dart';
import 'package:http/http.dart' as http;

class EstudianteProvider  {
  Future<Estudiante?> getEstudiante() async {
    // final header = {
    //   "Content-Type": "application/json",
    // };

    // var response = await http.post(
    //   Uri.parse("http://localhost:8089/ords/final_bases/assistence/students/"),
    //   headers: header,
    // );

    // if (response.statusCode == 200) {
    //   print(response.body);
    // } else {
    //   throw response.body;
    // }
    return Estudiante.fromJson(constants.assistence);
  }
}

EstudianteProvider estudianteProvider = EstudianteProvider();

