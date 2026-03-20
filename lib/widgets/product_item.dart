// ignore: file_names
import 'package:app_clone_mercado_livre/cart.store.dart';
import 'package:app_clone_mercado_livre/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartStore = GetIt.I.get<CartStore>();
    final installmentPrice = product.price / 10;
    return Card(
      elevation: 3,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      color: Colors.white,
      child: SizedBox(
        height: 220,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: 195,
                color: const Color.fromARGB(255, 231, 229, 229),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/${product.image}",
                      height: 190,
                      width: 150,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(product.description, style: TextStyle(fontSize: 15)),
                    Text(
                      "R\$ ${product.price.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: "em "),
                          TextSpan(
                            text:
                                "10x R\$ ${installmentPrice.toStringAsFixed(2)} sem juros ",
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      product.titleFrete,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      product.variacoes,
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Observer(
                        builder: (_) {
                          return Row(
                            children: List.generate(5, (index) {
                              return InkWell(
                                onTap: () {
                                  product.setRating(index + 1);
                                },
                                child: Icon(
                                  index < product.rating
                                      ? Icons.star
                                      : Icons.star_border_outlined,
                                  size: 20,
                                  color: Colors.lightBlueAccent,
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12, bottom: 10),
                        child: InkWell(
                          key: Key("Add carrinho"),
                          child: Text(
                            "Add carrinho",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue.shade400,
                              fontSize: 15,
                            ),
                          ),
                          onTap: () {
                            final success = cartStore.addCart(product);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  success
                                      ? "Produto adicionado!"
                                      : "Produto não adicionado!",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                backgroundColor: success
                                    ? Color(0xFFFFD835)
                                    : Colors.red,
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
