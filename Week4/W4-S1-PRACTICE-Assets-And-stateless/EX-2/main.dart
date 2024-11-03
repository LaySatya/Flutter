import 'package:flutter/material.dart';

// store images
const String dartImage = 'assets/W4-S1-Assets-Stateless-Widget/dart.png';
const String firebaseImage = 'assets/W4-S1-Assets-Stateless-Widget/firebase.png';
const String flutterImage = 'assets/W4-S1-Assets-Stateless-Widget/flutter.png';
const String errorImage = 'assets/W4-S1-Assets-Stateless-Widget/error-image.jpg';

// enum for our products
enum Product {
  Dart,
  Flutter,
  Firebase,
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  // get title
  String getProductTitle(Product product) {
    return switch (product) {
      Product.Dart => 'Dart',
      Product.Flutter => 'Flutter',
      Product.Firebase => 'Firebase'
    };
  }

// get description
  String getProductDescription(Product product) {
    return switch (product) {
      Product.Dart => 'the dart object language',
      Product.Flutter => 'the best mobile widget library',
      Product.Firebase => 'the best cloud database'
    };
  }

// get images
  String getProductImage(Product product) {
    return switch (product) {
      Product.Dart => dartImage,
      Product.Flutter => flutterImage,
      Product.Firebase => firebaseImage
    };
  }

  @override
  Widget build(BuildContext context) {
    return  Card(
      shadowColor: Colors.white,
      margin: const EdgeInsets.only(top: 15),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 0, 2),
            child: Image(
              image: AssetImage(
                getProductImage(product),
              ),
              width: 100,
              height: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
            child: Text(
              getProductTitle(product),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 12),
            child: Text(
              getProductDescription(product),
            ),
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
      home: Scaffold(
    backgroundColor: Colors.blue,
    body: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProductCard(product: Product.Dart),
          ProductCard(product: Product.Flutter),
          ProductCard(product: Product.Firebase),
        ],
      ),
    ),
  )));
}
