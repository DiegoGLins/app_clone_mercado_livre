import 'package:app_clone_mercado_livre/model/product_model.dart';

class CartBuyModel {
  final List<Product> products;

  CartBuyModel({List<Product>? products}) : products = products ?? [];
}
