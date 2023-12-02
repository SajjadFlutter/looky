class BarberServiceModel {
  List<Results>? results;

  BarberServiceModel({this.results});

  BarberServiceModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? slug;
  String? title;
  String? icon;

  Results({this.slug, this.title, this.icon});

  Results.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    title = json['title'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slug'] = slug;
    data['title'] = title;
    data['icon'] = icon;
    return data;
  }
}