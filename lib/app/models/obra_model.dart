class Obra {
  List<Items>? items;
  bool? hasMore;
  int? limit;
  int? offset;
  int? count;
  List<Links>? links;

  Obra(
      {this.items,
      this.hasMore,
      this.limit,
      this.offset,
      this.count,
      this.links});

  Obra.fromJson(Map<String, dynamic> json) {
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
  String? titulo;

  Items({this.titulo});

  Items.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['titulo'] = titulo;
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
