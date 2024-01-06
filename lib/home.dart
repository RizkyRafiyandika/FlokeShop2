import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flokemon/Model/shop.dart';
import 'package:flokemon/components/My_drawer.dart';
import 'package:flokemon/components/My_product_tile.dart';
import 'package:flokemon/withlist.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late Future<List<Product>> productList;

  // Future<List<Product>> fetchProduct() async {
  //   String url = "http://10.0.2.2:3000/product1";
  //   var resp = await http.get(Uri.parse(url));
  //   var result = jsonDecode(resp.body);

  //   print(result);

  //   List<Product> productList = [];

  //   for (var item in result) {
  //     Product fetchProduct = Product.fromJson(item);
  //     productList.add(fetchProduct);
  //   }

  //   return productList;
  // }

  late CarouselController carouselController;
  int myCurrentIndex = 0;

  final List<String> items = [
    'assets/Coro_poke1.jpg',
    'assets/Coro_poke2.jpg',
    'assets/Coro_poke3.jpg',
    'assets/Coro_poke4.jpg',
    'assets/Coro_poke5.jpg',
  ];

  @override
  void initState() {
    super.initState();
    // productList = fetchProduct(); // Memperbaiki penamaan variabel
    carouselController = CarouselController();
  }

  Widget build(BuildContext context) {
    final String username =
        ModalRoute.of(context)!.settings.arguments as String;
    final products = context.watch<Shop>().shop;

    return Scaffold(
      backgroundColor: Color.fromRGBO(227, 227, 137, 1),
      appBar: AppBar(
        // Your app bar code
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        flexibleSpace: Center(
          child: Container(
            child: Image.asset(
              "assets/pokeball.png",
              height: 50,
              width: 50,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WithListPage()),
              );
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Hello Trainer $username!! Welcome',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Raleway',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        // Your TextField code
                        decoration: InputDecoration(
                          hintText: 'Find Out your Favorite Pokemon',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          fillColor: Color.fromARGB(255, 250, 250, 182),
                          filled: true,
                        ),
                        onChanged: (value) {
                          // Add search functionality here
                        },
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(width: 40),
                      child: IconButton(
                        icon: Icon(Icons.sort),
                        onPressed: () {
                          // Add sorting functionality here
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'FlokeShope',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Raleway',
                  ),
                ),
              ),
              SizedBox(height: 20),
              CarouselSlider(
                options: CarouselOptions(
                    height: 150,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    viewportFraction: 1.0,
                    enableInfiniteScroll: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        myCurrentIndex = index;
                      });
                    }),
                items: items.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        child: Image.asset(item, fit: BoxFit.cover),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 8),
              Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: myCurrentIndex,
                  count: items.length, // Sesuaikan dengan jumlah slide Anda
                  effect: WormEffect(
                      dotColor: Colors.yellow,
                      activeDotColor: Color.fromRGBO(216, 254, 91, 1)),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Menentukan jumlah kolom
                      crossAxisSpacing: 10, // Spasi antar kolom
                      mainAxisSpacing: 30, // Spasi antar baris
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductTile(product: product);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
