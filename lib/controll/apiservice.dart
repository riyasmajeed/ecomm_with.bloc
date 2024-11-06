import 'package:ecommewithbloc/mode/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = "https://dummyjson.com/products";

  /// Fetches the list of products from the API
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response as a map
      Map<String, dynamic> apiResponse = jsonDecode(response.body);

      // Access the 'products' key in the JSON object
      List<dynamic> productData = apiResponse['products'];

      // Convert the JSON list into a List of Product objects
      return productData.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }

  /// Updates a product's price and description
 Future<Product> updateProduct(int id, String title, double price, String description) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.put(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "title": title,  // Pass the title to be updated
        "price": price,
        "description": description,
      }),
    );

    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update product");
    }
}

}
