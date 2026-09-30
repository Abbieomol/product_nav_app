
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Navigation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProductListPage(),
    );
  }
}

class Product {
  final String name;
  final String description;
  final int price;
  final Color color;
  final int rating;

  const Product({
    required this.name,
    required this.description,
    required this.price,
    required this.color,
    required this.rating,
  });
}


final List<Product> products = [
  const Product(
    name: 'Pixel',
    description: 'Pixel is the most featureful phone ever',
    price: 800,
    color: Colors.indigo,
    rating: 3,
  ),
  const Product(
    name: 'Laptop',
    description: 'Laptop is most productive development tool',
    price: 2000,
    color: Colors.green,
    rating: 3,
  ),
  const Product(
    name: 'Tablet',
    description: 'Tablet is the most useful device ever for meeting',
    price: 1500,
    color: Color(0xFFC9B94B),
    rating: 3,
  ),
  const Product(
    name: 'Pen Drive',
    description: 'Pen drive is handy for quick file transfers',
    price: 100,
    color: Colors.brown,
    rating: 3,
  ),
  const Product(
    name: 'Floppy Drive',
    description: 'A classic storage device from the past',
    price: 50,
    color: Colors.teal,
    rating: 3,
  ),
];


class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Navigation')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: product),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  Container(
                    width: 110,
                    height: 90,
                    color: product.color,
                    alignment: Alignment.center,
                    child: Text(
                      product.name.toLowerCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            product.description,
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 4),
                          Text('Price: ${product.price}'),
                          const SizedBox(height: 4),
                          StarRow(rating: product.rating),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 220,
            color: product.color,
            alignment: Alignment.center,
            child: Text(
              product.name.toLowerCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            product.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              product.description,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          Text('Price: ${product.price}'),
          const SizedBox(height: 12),
          StarRow(rating: product.rating),
        ],
      ),
    );
  }
}


class StarRow extends StatelessWidget {
  final int rating;
  final int max;

  const StarRow({super.key, required this.rating, this.max = 3});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        max,
            (i) => Icon(
          Icons.star,
          size: 18,
          color: i < rating ? Colors.red : Colors.red.shade100,
        ),
      ),
    );
  }
}