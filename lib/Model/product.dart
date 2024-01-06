class Product {
  final String id; // New field for the product ID
  final String name;
  final double price;
  final String description;
  final String imagePath;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json['id'].toString(),
      name: json['name'].toString(),
      price: json['price'] as double,
      description: json['description'].toString(),
      imagePath: json['imagePath'].toString());
}
