import 'package:mobx/mobx.dart';

part 'product_model.g.dart';

class Product = ProductBase with _$Product;

abstract class ProductBase with Store {
  final int id;
  final String image;
  final String description;
  final double price;
  final String? condicaoPgto;
  final String titleFrete;
  final String variacoes;

  @observable
  int rating;

  ProductBase({
    required this.id,
    required this.image,
    required this.description,
    required this.price,
    required this.titleFrete,
    this.variacoes = "",
    this.condicaoPgto,
    int? rate,
  }) : rating = rate ?? 0;

  @action
  void setRating(int value) {
    rating = value;
  }
}
