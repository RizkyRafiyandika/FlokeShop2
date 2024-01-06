import 'package:flutter/material.dart';
import 'package:flokemon/components/My_button.dart';
import 'package:flokemon/components/my_textField.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void registerUser(BuildContext context) async {
    String url = 'http://localhost:3000/register';
    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          'username': username,
          'password': password,
          'email': email,
        },
      );

      if (response.statusCode == 200) {
        // Registrasi berhasil, lakukan navigasi atau tampilkan pesan sukses
      } else {
        // Registrasi gagal, tampilkan pesan kesalahan
      }
    } catch (e) {
      // Tangani kesalahan koneksi atau respons dari backend
    }

    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      Navigator.pushNamed(
        context,
        '/login',
        arguments: {
          'username': username,
          'password': password,
          'email': email,
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields.'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 233, 91),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Register",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 25),
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                SizedBox(height: 25),
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                SizedBox(height: 25),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                SizedBox(height: 25),
                MyButton(
                  onTap: () {
                    registerUser(
                        context); // Memanggil fungsi saat tombol ditekan
                  },
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Have "),
                    SizedBox(width: 4),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
