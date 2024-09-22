import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:simple_calculator/pages/login/login.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  RxBool loggedIn = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Login method
  Future<void> login(String email, String password) async {
    try {
      isLoading(true); // Set loading to true
      errorMessage(''); // Clear previous error messages

      // Firebase login using email and password
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      loggedIn(true);
      // Show a success message or navigate to the next screen
      Get.snackbar('Success', 'Login successful');
    } on FirebaseAuthException catch (e) {
      // Handle Firebase errors
      if (e.code == 'user-not-found') {
        errorMessage('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        errorMessage('Wrong password provided.');
      } else {
        errorMessage(e.message ?? 'An unknown error occurred.');
      }
    } catch (e) {
      // Handle other errors
      errorMessage('An error occurred. Please try again.');
    } finally {
      isLoading(false); // Set loading to false
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut(); // Sign out from Firebase
      Get.offAll(
          LoginPage()); // Navigate to LoginPage and clear navigation stack
    } catch (e) {
      Get.snackbar('Error', 'Failed to log out. Please try again.');
    }
  }
}
