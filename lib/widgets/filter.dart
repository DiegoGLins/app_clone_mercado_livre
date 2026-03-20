import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../home.store.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I.get<HomeStore>();
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),

      child: Row(
        children: [
          const SizedBox(width: 12),

          Observer(
            builder: (context) {
              return Text(
                " ${store.products.length} resultados",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              );
            },
          ),

          const Spacer(),
          Expanded(
            child: InkWell(
              onTap: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Filtrar (2)",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.expand_more, size: 25, color: Colors.blue),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
