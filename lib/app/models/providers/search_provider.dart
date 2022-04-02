import 'dart:convert';

import 'package:http/http.dart' as http;
import '../search_model.dart';

class SearchProvider  {
   Future<Search?> getEstudiante(String codigo) async {
    final header = {
      "Content-Type": "application/json",
    };

    var response = await http.get(
      Uri.parse("http://localhost:8089/ords/final_bases/certificates/estudiantesdetail/$codigo"),
      headers: header,
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.body);

      throw response.body;
    }
    return Search.fromJson(json.decode(response.body));
  }
}

SearchProvider searchProvider = SearchProvider();