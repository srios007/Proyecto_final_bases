import 'package:get/get.dart';

import '../prueba_model.dart';

class PruebaProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Prueba.fromJson(map);
      if (map is List) return map.map((item) => Prueba.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Prueba?> getPrueba(int id) async {
    final response = await get('prueba/$id');
    return response.body;
  }

  Future<Response<Prueba>> postPrueba(Prueba prueba) async =>
      await post('prueba', prueba);
  Future<Response> deletePrueba(int id) async => await delete('prueba/$id');
}
