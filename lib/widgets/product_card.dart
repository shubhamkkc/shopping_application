import 'package:flutter/material.dart';
import 'package:shopping_application/pages/product_desc.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final Color backgroundColor;
  final List<String> size;
  const ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.size,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      margin: EdgeInsets.all(18),
      // color: Color.fromARGB(255, 240, 237, 205),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 10),
          Text(price, style: Theme.of(context).textTheme.titleMedium),
          Center(
            child: Image.asset(
              image,
              height: 275,
            ),
          )
        ],
      ),
    );
  }
}
