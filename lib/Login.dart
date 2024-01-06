import 'package:flutter/material.dart';
import 'package:flokemon/components/My_button.dart';
import 'package:flokemon/components/my_textField.dart';
import 'package:flokemon/components/squere_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signUserIn(BuildContext context) async {
    final Map<String, String> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    String registeredUsername = arguments['username'] ?? '';
    String registeredPassword = arguments['password'] ?? '';

    // GoogleSignInAccount? googleUser = await GoogleAuth.signIn();

    String enteredUsername = usernameController.text;
    String enteredPassword = passwordController.text;

    // if (googleUser != null) {
    //   String googleUsername = googleUser.displayName ?? '';
    //   String googleEmail = googleUser.email ?? '';

    //   // Membandingkan hasil login Google dengan data terdaftar
    //   if ((googleUsername == registeredUsername ||
    //           googleEmail == registeredUsername) &&
    //       registeredPassword.isNotEmpty) {
    //     // Login berhasil, navigasi ke halaman home
    //     Navigator.pushNamed(context, '/home');
    //     return;
    //   }
    // }

    // Jika validasi dengan Google tidak berhasil, coba validasi dari halaman register
    if (enteredUsername == registeredUsername &&
        enteredPassword == registeredPassword) {
      // Login berhasil, navigasi ke halaman home
      Navigator.pushNamed(
        context,
        '/home',
        arguments: usernameController.text,
      );
    } else {
      // Login gagal, tampilkan pesan kesalahan
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login failed. Please check your credentials.'),
          duration: Duration(microseconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 233, 91),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/pokeball.png", height: 75),
                const SizedBox(height: 25),
                const Text(
                  "Welcome Trainer !!",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Forget Password",
                        style: TextStyle(
                            color: Color.fromARGB(255, 16, 16, 16),
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                MyButton(
                  onTap: () {
                    signUserIn(
                        context); // Panggil fungsi signUserIn saat tombol "Login" ditekan
                  },
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[400],
                        ),
                      ),
                      const Text("Or Continued With"),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SquareTile(imagePath: 'assets/facebook.png'),
                    SizedBox(width: 10),
                    SquareTile(imagePath: 'assets/google.png')
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: const Text("Not A number"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text(
                        "Register Now",
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
