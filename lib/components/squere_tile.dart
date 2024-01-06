import 'package:flutter/material.dart';
import 'package:flokemon/components/googleSign_in.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () async {
          await GoogleAuth.signIn();
        },
        splashColor:
            Colors.white.withOpacity(0.5), // Ubah warna splash sesuai keinginan
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color.fromARGB(255, 247, 71, 71),
          ),
          child: Image.asset(imagePath, height: 25),
        ),
      ),
    );
  }
}
