import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_calculator/components/navigator/navigator.dart';
import 'package:simple_calculator/controllers/login/login.dart';
import 'package:simple_calculator/pages/registration/registration.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Create an instance of LoginController using GetX
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login with Firebase'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Email Field
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Password Field
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Error message using GetX Obx
              Obx(() => loginController.errorMessage.isNotEmpty
                  ? Text(
                      loginController.errorMessage.value,
                      style: const TextStyle(color: Colors.red),
                    )
                  : const SizedBox.shrink()),

              const SizedBox(height: 16),

              // Login Button with Loading State
              Obx(() => ElevatedButton(
                    onPressed: loginController.isLoading.value
                        ? null
                        : () async {
                            if (_formKey.currentState!.validate()) {
                              await loginController.login(
                                _emailController.text,
                                _passwordController.text,
                              );
                              if (loginController.loggedIn.value) {
                                Navigator.of(context).push<void>(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NavigatorBuilder(),
                                  ),
                                );
                              }
                            }
                          },
                    child: loginController.isLoading.value
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text('Login'),
                  )),

              // Navigation to Register Page
              TextButton(
                onPressed: () {
                  Get.to(() => RegisterPage()); // Navigate to Register Page
                },
                child: const Text('Don\'t have an account? Register here'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
