class Places {
  final String imageUrl;
  final String title;
  final String price;
  final String description;
  final String included;
  final String itinerary;
  final List<dynamic> rating;

  const Places({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.description,
    required this.itinerary,
    required this.included,
    required this.rating,
  });
}
