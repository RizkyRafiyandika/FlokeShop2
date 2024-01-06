import 'package:flutter/material.dart';
import 'package:flokemon/Model/Detail.blastoite.dart';
import 'package:flokemon/Model/Detail_charoza.dart';
import 'package:flokemon/Model/Detail_kuramon.dart';
import 'package:flokemon/Model/Detail_pikachu.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Model/shop.dart';

class ProductTile extends StatefulWidget {
  final product;

  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  List<Map<String, dynamic>> productList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      print('titit');
      final res =
          await http.get(Uri.parse('http://192.168.0.108:3000/product1/'));
      final jsonResponse = jsonDecode(res.body);
      if (mounted) {
        setState(() {
          productList = List<Map<String, dynamic>>.from(jsonResponse['data']);
        });
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  void addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Are you sure about that, Trainer?",
            style: TextStyle(fontFamily: "Raleway")),
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
                    context.read<Shop>().addCart(widget.product);
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
    // fetchData();
    print(productList);
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 246, 252, 212),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.all(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (widget.product.name == 'Raikiri') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PikachuScreen(nama: 'Raikiri')),
                );
              } else if (widget.product.name == 'Kuramon') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KuramonScreen()),
                );
              } else if (widget.product.name == 'Gokakyu') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CharizardScreen()),
                );
              } else if (widget.product.name == 'Blast') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BlastoiteScreen()),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                width: double.infinity,
                height: 65,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    // image: AssetImage(snapshot.data![0].imagePath),
                    image: AssetImage(widget.product.imagePath),
                  ),
                  // borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Raleway",
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          // image:AssetImage(snapshot.data![0].description),
                          image: AssetImage(widget.product.description),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(216, 254, 91, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    '\$${widget.product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      // Gaya teks Anda di sini
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: IconButton(
                    onPressed: () => addToCart(context),
                    icon: const Icon(Icons.add_outlined),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//     );
//   }
// }
