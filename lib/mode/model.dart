class Product {
   final int id; 
  final String name;
  final double price;
  final String description;
  final String image;
  final double rating;

  Product({
     required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
  });

  // Factory constructor to parse from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'], 
      name: json['title'],                   // Maps to the title in JSON
      price: json['price'].toDouble(),        // Parses price as a double
      description: json['description'],       // Maps to description in JSON
      image: json['thumbnail'],               // Maps to thumbnail in JSON for main image URL
      rating: json['rating'].toDouble(),      // Parses rating as a double
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': name,
      'price': price,
      'description': description,
    };
  }
}

