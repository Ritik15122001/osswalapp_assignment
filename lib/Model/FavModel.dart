class Product {
  final String name;
  final String description;
  final double price;
  bool isFavorite;

  Product({
    required this.name,
    required this.description,
    required this.price,
    this.isFavorite = false,
  });
}
