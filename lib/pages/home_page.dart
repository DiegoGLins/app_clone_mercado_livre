import 'package:app_clone_mercado_livre/cart.store.dart';
import 'package:app_clone_mercado_livre/pages/cart_buy.dart';
import 'package:app_clone_mercado_livre/home.store.dart';
import 'package:app_clone_mercado_livre/widgets/filter.dart';
import 'package:app_clone_mercado_livre/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    final productsStore = GetIt.I.get<HomeStore>();
    productsStore.loadingProducts();
  }

  @override
  Widget build(BuildContext context) {
    final cartStore = GetIt.I.get<CartStore>();
    final productsStore = GetIt.I.get<HomeStore>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD835),
        toolbarHeight: 120,
        title: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const TextField(
                      key: Key("inputSearch"),
                      decoration: InputDecoration(
                        hintText: "Buscar no Mercado Livre",
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 8),
                  child: Observer(
                    builder: (_) {
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          InkWell(
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.black,
                              size: 28,
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return CartBuy();
                                  },
                                ),
                              );
                            },
                          ),

                          // Badge
                          if (cartStore.cart.isNotEmpty)
                            Positioned(
                              right: -6,
                              top: -6,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 18,
                                  minHeight: 18,
                                ),
                                child: Text(
                                  '${cartStore.cart.length}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 12),

            Row(
              children: [
                Icon(Icons.pin_drop_outlined, color: Colors.black, size: 22),
                SizedBox(width: 10),
                Text(
                  "Informe o seu cep",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                Spacer(flex: 1),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/chevron_right.png",
                    height: 30,
                  ),
                ),
                Spacer(flex: 10),
              ],
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Filter(),
            Expanded(
              child: Observer(
                builder: (context) {
                  if (productsStore.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFFFD835),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: productsStore.products.length,
                    itemBuilder: (context, index) {
                      final product = productsStore.products[index];
                      return ProductItem(product: product);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
