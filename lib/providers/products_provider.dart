import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/models/product.dart';

const List<Product> allProducts = [
  Product(
    id: '1',
    title: 'Groovy Shorts',
    price: 12,
    image: 'assets/shorts.png',
  ),
  Product(id: '2', title: 'Karati Kit', price: 34, image: 'assets/karati.png'),
  Product(id: '3', title: 'Denim Jeans', price: 54, image: 'assets/jeans.png'),
  Product(
    id: '4',
    title: 'Red Backpack',
    price: 14,
    image: 'assets/backpack.png',
  ),
  Product(id: '5', title: 'Drum & Sticks', price: 29, image: 'assets/drum.png'),
  Product(
    id: '6',
    title: 'Blue Suitcase',
    price: 44,
    image: 'assets/suitcase.png',
  ),
  Product(
    id: '7',
    title: 'Roller skates',
    price: 52,
    image: 'assets/skates.png',
  ),
  Product(
    id: '8',
    title: 'Electric Guitar',
    price: 79,
    image: 'assets/guitar.png',
  ),
];

final productProvider = Provider((ref) {
  return allProducts;
});

final reducedPricProvider = Provider((ref){
return allProducts.where((p)=> p.price < 50).toList();
});
