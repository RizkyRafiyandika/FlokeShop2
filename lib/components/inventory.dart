import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flokemon/Model/product.dart';
import 'package:provider/provider.dart';

import '../Model/shop.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 223, 206, 50),
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Inventory'),
      ),
      backgroundColor: Color.fromRGBO(227, 227, 156, 1),
      body: Consumer<Shop>(
        builder: (context, shop, child) {
          final inventory = shop.inventory;

          return inventory.isEmpty
              ? Center(
                  child: Text(
                    'There are no item.',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: inventory.length,
                        itemBuilder: (context, index) {
                          final item = inventory[index];

                          return ListTile(
                            title: Text(item.name),
                            subtitle: Text(
                              '\$${item.price.toStringAsFixed(2)}',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 25, left: 10, right: 10),
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
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$${shop.calculateTotalPrice(inventory).toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
