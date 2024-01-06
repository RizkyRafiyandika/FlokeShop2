import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  static final _oauth = GoogleSignIn();

  static Future<GoogleSignInAccount?> signIn() async {
    try {
      var user = await _oauth.signIn();
      if (user != null) {
        print(user.displayName);
        print(user.email);
        // return user;
        await _oauth.signOut(); // Logout user after retrieving details
      }
      return user;
    } catch (e) {
      print('Sign-in error: $e');
      return null;
    }
  }
}
