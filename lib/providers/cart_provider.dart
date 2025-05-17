import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_tutorial/models/product.dart';
part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  //initial values
  @override
  Set<Product> build() {
    return const {};
  }

  //methods to update state
  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}

//manual usecase

// final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
//   return CartNotifier();
// });


@riverpod
int cartTotalCost(ref){
  final cartProducts = ref.watch(cartNotifierProvider);
  int total = 0;
  for (Product products in cartProducts) {
    total += products.price;
  }
  return total;
}