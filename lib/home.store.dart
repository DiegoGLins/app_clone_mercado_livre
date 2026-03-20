import 'package:app_clone_mercado_livre/model/product_model.dart';
import 'package:mobx/mobx.dart';
part "home.store.g.dart";

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  ObservableList<Product> _products = ObservableList.of([]);
  List<Product> get products => _products;

  @observable
  bool isLoading = false;

  @action
  void randowList() {
    _products.clear();

    for (int i = 0; i < 15; i++) {
      _products.add(
        Product(
          id: i,
          image: "iphone.png",
          description: "Apple Iphone 11 Pro (128gb) - Preto",
          price: 599.99 + (i * 600) - (0.01 * i),
          titleFrete: "Frete Grátis",
          variacoes: "Disponível em 6 cores",
        ),
      );
    }
  }

  @action
  Future<void> loadingProducts() async {
    isLoading = true;
    await Future.delayed(Duration(seconds: 3));

    randowList();
    isLoading = false;
  }
}
