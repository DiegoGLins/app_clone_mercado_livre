import 'package:flutter/material.dart';

class CardProduct extends StatefulWidget {
  final Object image;
  const CardProduct({super.key, required this.image});

  @override
  State<CardProduct> createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  @override
  Widget build(BuildContext context) {
    Object? image;
    // final pathImage = image;
    return Card(
      elevation: 3,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      color: Colors.white,
      child: Column(children: [Image.asset("$image")]),
    );
  }
}
