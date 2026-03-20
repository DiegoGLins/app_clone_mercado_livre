import 'package:app_clone_mercado_livre/cart.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CartBuy extends StatelessWidget {
  const CartBuy({super.key});

  @override
  Widget build(BuildContext context) {
    final cartStore = GetIt.I.get<CartStore>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD835),
        toolbarHeight: 80,
        leading: BackButton(
          key: Key("backBtn"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          "Carrinho de compras",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Observer(
        builder: (_) {
          if (cartStore.cart.isEmpty) {
            return Center(
              child: Image.asset(
                key: Key("imageCart"),
                "assets/images/empty_cart.png",
                height: 200,
                width: 2000,
              ),
            );
          }

          return ListView.builder(
            itemCount: cartStore.cart.length,
            itemBuilder: (context, index) {
              final product = cartStore.cart[index];
              return Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                child: Row(
                  children: [
                    Text("$index - ", style: TextStyle(fontSize: 14)),
                    Text(product.description, style: TextStyle(fontSize: 14)),
                    Text(" - R\$ ${product.price.toStringAsFixed(2)}"),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
