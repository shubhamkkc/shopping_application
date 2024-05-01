import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_application/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Cart")),
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: ((context, index) {
            return ListTile(
              leading: CircleAvatar(
                radius: 45,
                child: Image.asset(cart[index]['image'] as String),
              ),
              title: Text(
                cart[index]['title'] as String,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              subtitle: Text('size: ${cart[index]['size']}' as String),
              trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Delete item'),
                            content:
                                const Text('Are you sure you want to delete'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('NO')),
                              TextButton(
                                  onPressed: () {
                                    Provider.of<CartProvider>(context,
                                            listen: false)
                                        .deleteProduct(cart[index]);
                                    Navigator.of(context).pop();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("item deleted"),
                                      ),
                                    );
                                  },
                                  child: const Text('Yes')),
                            ],
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            );
          })),
    );
  }
}
