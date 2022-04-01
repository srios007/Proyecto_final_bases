class Empleado {
  List<Items>? items;
  bool? hasMore;
  int? limit;
  int? offset;
  int? count;
  List<Links>? links;

  Empleado(
      {this.items,
      this.hasMore,
      this.limit,
      this.offset,
      this.count,
      this.links});

  Empleado.fromJson(Map<String, dynamic> json) {
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
  String? codunidad;
  String? codempleado;
  String? nombreempleado;
  String? apellidoempleado;
  String? cedulaempleado;
  String? celularempleado;
  String? correoempleado;

  Items(
      {this.codunidad,
      this.codempleado,
      this.nombreempleado,
      this.apellidoempleado,
      this.cedulaempleado,
      this.celularempleado,
      this.correoempleado});

  Items.fromJson(Map<String, dynamic> json) {
    codunidad = json['codunidad'];
    codempleado = json['codempleado'];
    nombreempleado = json['nombreempleado'];
    apellidoempleado = json['apellidoempleado'];
    cedulaempleado = json['cedulaempleado'];
    celularempleado = json['celularempleado'];
    correoempleado = json['correoempleado'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['codunidad'] = codunidad;
    data['codempleado'] = codempleado;
    data['nombreempleado'] = nombreempleado;
    data['apellidoempleado'] = apellidoempleado;
    data['cedulaempleado'] = cedulaempleado;
    data['celularempleado'] = celularempleado;
    data['correoempleado'] = correoempleado;
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
