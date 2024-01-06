import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flokemon/Model/product.dart';
import 'package:provider/provider.dart';

import 'Model/shop.dart';

class WithListPage extends StatelessWidget {
  const WithListPage({Key? key});

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          "Are you sure you want to remove it, Trainer?",
          style: TextStyle(fontFamily: "Raleway"),
        ),
        actionsPadding: EdgeInsets.zero,
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().removeCart(product);
                  },
                  child: Text("Yes"),
                ),
              ),
            ],
          ),
        ],
        backgroundColor: Color.fromRGBO(216, 254, 91, 1),
      ),
    );
  }

  void buyItems(BuildContext context) {
    final cart = context.read<Shop>().cart;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          "Want to buy these items?",
          style: TextStyle(fontFamily: "Raleway"),
        ),
        actionsPadding: EdgeInsets.zero,
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text("No"),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    context.read<Shop>().buyItems(cart);
                  },
                  child: Text("Yes"),
                ),
              ),
            ],
          ),
        ],
        backgroundColor: Color.fromRGBO(216, 254, 91, 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 223, 206, 50),
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('PokeCart'),
      ),
      backgroundColor: Color.fromRGBO(227, 227, 156, 1),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];

                return Column(
                  children: [
                    ListTile(
                      title: Text(item.name),
                      subtitle: Text(
                        '\$${item.price.toStringAsFixed(2)}',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_shopping_cart_rounded),
                        onPressed: () => removeItemFromCart(context, item),
                      ),
                    ),
                    Divider(
                      color: Color.fromRGBO(216, 254, 91, 1),
                    ), // Add Divider here
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25, left: 10, right: 10),
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(216, 254, 91, 1),
                borderRadius: BorderRadius.circular(120.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Price:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${context.read<Shop>().calculateTotalPrice(cart).toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => buyItems(context),
            child: Text('Buy'),
          ),
        ],
      ),
    );
  }
}
