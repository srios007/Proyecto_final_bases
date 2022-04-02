import 'dart:convert';
import '../actores_model.dart';
import 'package:http/http.dart' as http;


class ActorProvider {
   Future<Actor?> getEmpleado(String obra) async {
    final header = {
      "Content-Type": "application/json",
    };

    var response = await http.get(
      Uri.parse("http://localhost:8089/ords/final_bases/certificates/estudiantes/$obra"),
      headers: header,
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.body);

      throw response.body;
    }
    return Actor.fromJson(json.decode(response.body));
  }
}

ActorProvider actorProvider = ActorProvider();

