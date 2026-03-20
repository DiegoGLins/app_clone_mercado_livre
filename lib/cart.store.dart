import 'package:app_clone_mercado_livre/model/product_model.dart';
import 'package:mobx/mobx.dart';

part 'cart.store.g.dart';

class CartStore = CartStoreBase with _$CartStore;

abstract class CartStoreBase with Store {
  @observable
  ObservableList<Product> _cart = ObservableList.of(<Product>[]);
  List<Product> get cart => _cart;

  @action
  bool addCart(Product product) {
    final exists = _cart.any((i) => i.id == product.id);
    if (exists) {
      return false;
    } else {
      _cart.add(product);
      return true;
    }
  }
}
