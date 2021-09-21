import 'package:flutter/material.dart';
import 'package:flutter_cataloge/models/catalog.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(catalog.image),
        ],
      ),
    );
  }
}
