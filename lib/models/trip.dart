class Trip {
  final String id;
  final String title;
  final List<String> imageUrls;
  final double price;
  final double rating;
  final String summary;
  final List<String> includes;
  final List<String> excludes;
  final String terms;
  final int totalPax;

  Trip({
    required this.id,
    required this.title,
    required this.imageUrls,
    required this.price,
    required this.rating,
    required this.summary,
    required this.includes,
    required this.excludes,
    required this.terms,
    required this.totalPax,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['id'],
      title: json['title'],
      imageUrls: List<String>.from(json['imageUrls']),
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
      summary: json['summary'],
      includes: List<String>.from(json['includes']),
      excludes: List<String>.from(json['excludes']),
      terms: json['terms'],
      totalPax: json['totalPax'],
    );
  }
}
