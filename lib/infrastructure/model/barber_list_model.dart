class BarberListModel {
  final int count;
  final String? next;
  final String? previous;
  final List<Barber> results;

  BarberListModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory BarberListModel.fromJson(Map<String, dynamic> json) {
    var resultsJson = json['results'] as List<dynamic>;
    List<Barber> barberList = resultsJson.map((result) => Barber.fromJson(result)).toList();

    return BarberListModel(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: barberList,
    );
  }
}

class Barber {
  final String slug;
  final String fullname;
  final bool isShop;
  final String avatar;
  final String address;
  final double lat;
  final double lon;
  final double rate;
  final double distance;
  final bool isBookmarked;

  Barber({
    required this.slug,
    required this.fullname,
    required this.isShop,
    required this.avatar,
    required this.address,
    required this.lat,
    required this.lon,
    required this.rate,
    required this.distance,
    required this.isBookmarked,
  });

  factory Barber.fromJson(Map<String, dynamic> json) {
    return Barber(
      slug: json['slug'] as String,
      fullname: json['fullname'] as String,
      isShop: json['is_shop'] as bool,
      avatar: json['avatar'] as String,
      address: json['address'] as String,
      lat: json['lat'] as double,
      lon: json['lon'] as double,
      rate: json['rate'] as double,
      distance: json['distance'] as double,
      isBookmarked: json['is_bookmarked'] as bool,
    );
  }
}