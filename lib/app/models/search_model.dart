class Search {
  List<Items>? items;
  bool? hasMore;
  int? limit;
  int? offset;
  int? count;
  List<Links>? links;

  Search(
      {this.items,
      this.hasMore,
      this.limit,
      this.offset,
      this.count,
      this.links});

  Search.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
    hasMore = json['hasMore'];
    limit = json['limit'];
    offset = json['offset'];
    count = json['count'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links?.add(Links.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items?.map((v) => v.toJson()).toList();
    }
    data['hasMore'] = hasMore;
    data['limit'] = limit;
    data['offset'] = offset;
    data['count'] = count;
    if (links != null) {
      data['links'] = links?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? nombreestudiante;
  String? apellidoestudiante;
  String? codestudiante;
  String? titulo;
  String? nompersonaje;

  Items(
      {this.nombreestudiante,
      this.apellidoestudiante,
      this.codestudiante,
      this.titulo,
      this.nompersonaje});

  Items.fromJson(Map<String, dynamic> json) {
    nombreestudiante = json['nombreestudiante'];
    apellidoestudiante = json['apellidoestudiante'];
    codestudiante = json['codestudiante'];
    titulo = json['titulo'];
    nompersonaje = json['nompersonaje'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nombreestudiante'] = nombreestudiante;
    data['apellidoestudiante'] = apellidoestudiante;
    data['codestudiante'] = codestudiante;
    data['titulo'] = titulo;
    data['nompersonaje'] = nompersonaje;
    return data;
  }
}

class Links {
  String? rel;
  String? href;

  Links({this.rel, this.href});

  Links.fromJson(Map<String, dynamic> json) {
    rel = json['rel'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['rel'] = rel;
    data['href'] = href;
    return data;
  }
}
