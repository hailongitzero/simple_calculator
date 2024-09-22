import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_calculator/controllers/registration/registration_controller.dart';

class RegisterPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullnameController = TextEditingController();

  // Create an instance of the AuthController using GetX
  final RegistrationController authController =
      Get.put(RegistrationController());

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register with Firebase'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Full Name Field
              TextFormField(
                controller: _fullnameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

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
              Obx(() => authController.errorMessage.isNotEmpty
                  ? Text(
                      authController.errorMessage.value,
                      style: const TextStyle(color: Colors.red),
                    )
                  : const SizedBox.shrink()),

              const SizedBox(height: 16),

              // Register Button with Loading State
              Obx(() => ElevatedButton(
                    onPressed: authController.isLoading.value
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              authController.register(
                                _fullnameController.text,
                                _emailController.text,
                                _passwordController.text,
                              );
                            }
                          },
                    child: authController.isLoading.value
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text('Register'),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
