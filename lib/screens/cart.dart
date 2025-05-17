import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/providers/cart_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartNotifierProvider);
    final total = ref.watch(cartTotalCostProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children:
                  cartProducts.map((prodct) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        spacing: 10,
                        children: [
                          Image.asset(prodct.image, height: 60, width: 60),
                          Text(prodct.title),
                          Expanded(child: SizedBox()),
                          Text("\$${prodct.price}"),
                        ],
                      ),
                    );
                  }).toList(), // output cart products here
            ),
            Spacer(),
            Row(
              children: [
                Text(
                  "TOTAL:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                Text(" \$$total"),
              ],
            ),

            // output totals here
          ],
        ),
      ),
    );
  }
}
