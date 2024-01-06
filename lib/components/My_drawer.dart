import 'package:flutter/material.dart';
import 'package:flokemon/components/My_ListView.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 247, 247, 55),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            DrawerHeader(
              child: Image.asset(
                "assets/pokeball.png", // Replace with your logo asset path
                height: 80,
                width: 80,
              ),
            ),
            SizedBox(height: 10),
            listView(
                text: "Profile",
                icon: Icons.person,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/profile");
                }),
            listView(
                text: "Inventory",
                icon: Icons.add_box,
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushNamed(context, "/inventory");
                }),
          ]),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: listView(
                text: "exit",
                icon: Icons.exit_to_app,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/login');
                }),
          )
        ],
      ),
    );
  }
}
