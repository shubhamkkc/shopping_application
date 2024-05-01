import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_application/providers/cart_provider.dart';

class ProductDesc extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDesc({
    super.key,
    required this.product,
  });

  @override
  State<ProductDesc> createState() => _ProductDescState();
}

class _ProductDescState extends State<ProductDesc> {
  String? selectSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Image.asset(
            widget.product['image'] as String,
            height: 240,
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(30), right: Radius.circular(30)),
                color: Color.fromARGB(77, 104, 201, 185)),
            child: Column(children: [
              Text(
                widget.product['price'] as String,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.product['size'].length,
                    itemBuilder: (context, value) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () => {
                            setState(() {
                              selectSize = widget.product['size'][value];
                            })
                          },
                          child: Chip(
                            backgroundColor:
                                selectSize == widget.product['size'][value]
                                    ? Color.fromARGB(255, 235, 70, 70)
                                    : Colors.white,
                            label: Text(
                              widget.product['size'][value],
                              style: const TextStyle(
                                  fontSize: 23, color: Colors.black),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(8),
                width: 250,
                child: ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 235, 70, 70))),
                    onPressed: () {
                      if (selectSize != null) {
                        Provider.of<CartProvider>(context, listen: false)
                            .addProduct({
                          "id": widget.product['id'],
                          "title": widget.product['title'],
                          "price": widget.product['price'],
                          "size": selectSize,
                          "image": widget.product['image'],
                          "category": widget.product['category'],
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text("Prodcut add sucessfully in your cart"),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Please select size"),
                          ),
                        );
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart_checkout_outlined),
                        Text("Add to Cart")
                      ],
                    )),
              )
            ]),
          )
        ],
      ),
    );
  }
}
