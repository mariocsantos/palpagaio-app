import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthenticationRepository {
  bool isAuthenticated() {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    return firebaseAuth.currentUser != null;
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: ['email', 'profile'],
      ).signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final user = await FirebaseAuth.instance.signInWithCredential(credential);
      return user;
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
