import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../widget/custom/textformfiled.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final FocusNode emilFocus = FocusNode();

  final FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 25,
            children: [
              Text(
                'Sigin in to your Account',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'Enter your email and password to log in',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextFieldWidget(
                controller: emailController,
                label: 'Email Address',
                focusNode: emilFocus,
                validator: (value){
                  if (value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              TextFieldWidget(
                controller: passwordController,
                label: 'Passwor',
                focusNode: passwordFocus,
                obscureText: true,
                validator: (value){
                   if (value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                
              ),

              Center(
                child: ElevatedButton(
                  onPressed: ()async {
                    if (formKey.currentState!.validate()) {
                      
                    }
                  },
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
