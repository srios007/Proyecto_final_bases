class TravelExpenses {
  List<Items>? items;
  bool? hasMore;
  int? limit;
  int? offset;
  int? count;
  List<Links>? links;

  TravelExpenses({
    this.items,
    this.hasMore,
    this.limit,
    this.offset,
    this.count,
    this.links,
  });

  TravelExpenses.fromJson(Map<String, dynamic> json) {
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
  String? correoestudiante;
  String? codestudiante;
  int? sesiones;
  int? horas;
  String? periodo;
  String? obra;

  Items(
      {this.nombreestudiante,
      this.apellidoestudiante,
      this.correoestudiante,
      this.codestudiante,
      this.sesiones,
      this.horas,
      this.periodo,
      this.obra});

  Items.fromJson(Map<String, dynamic> json) {
    nombreestudiante = json['nombreestudiante'];
    apellidoestudiante = json['apellidoestudiante'];
    correoestudiante = json['correoestudiante'];
    codestudiante = json['codestudiante'];
    sesiones = json['sesiones'];
    horas = json['horas'];
    periodo = json['periodo'];
    obra = json['obra'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nombreestudiante'] = nombreestudiante;
    data['apellidoestudiante'] = apellidoestudiante;
    data['correoestudiante'] = correoestudiante;
    data['codestudiante'] = codestudiante;
    data['sesiones'] = sesiones;
    data['horas'] = horas;
    data['periodo'] = periodo;
    data['obra'] = obra;
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
