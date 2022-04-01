import 'dart:convert';
import 'package:http/http.dart' as http;
import '../obra_model.dart';

class ObraProvider {
  Future<Obra?> getObra() async {
    final header = {
      "Content-Type": "application/json",
    };

    var response = await http.get(
      Uri.parse("http://localhost:8089/ords/final_bases/certificates/obras"),
      headers: header,
    );

    if (response.statusCode == 200) {
      // print(response.body);
    } else {
      throw response.body;
    }
    return Obra.fromJson(json.decode(response.body));
  }
}

ObraProvider obraProvider = ObraProvider();
