import 'package:ecommewithbloc/mode/model.dart';
import 'package:ecommewithbloc/view/update.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name, style: TextStyle(fontWeight: FontWeight.bold))),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 222,
              width: 222,
              child: CircleAvatar(
                backgroundImage: NetworkImage(product.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$${product.price}", style: TextStyle(color: Colors.red, fontSize: 28, fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () async {
                        final updatedProduct = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProductPage(product: product),
                          ),
                        );

                        // If updatedProduct is not null, update the UI accordingly.
                        if (updatedProduct != null) {
                          // Here, you might want to refresh the product details or update state
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(product.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(product.description, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
