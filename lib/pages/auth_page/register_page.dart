import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_mart/controller/user_controller.dart';
import 'package:online_mart/widget/custom/textformfiled.dart';

import '../../controller/auth_contoller.dart';

class RegisterPage extends StatelessWidget {
   RegisterPage({super.key});
  
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final comPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final FocusNode emilFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final AuthController _authContoller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF1976D2), Color(0xFF00E5FF)],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.13,
                          horizontal: 20,
                        ),
                        child: Form(
                          key: formKey,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Register',
                                  style: Theme.of(context).textTheme.headlineLarge,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Already have an account? ",
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text(
                                        'Log in',
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                TextFieldWidget(label: 'Full Name',controller: usernameController, validator: (value){
                                  if(value.isEmpty){
                                    return 'Please enter your name ';
                                  }
                                  return null ; 
                                }),
                                SizedBox(height: 20,),
                                TextFieldWidget(
                                  controller: emailController,
                                  label: 'Email Address',
                                  focusNode: emilFocus,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                                      return 'Please enter a valid email address';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20),
                                TextFieldWidget(
                                  controller: passwordController,
                                  label: 'Password',
                                  focusNode: passwordFocus,
                                  obscureText: true,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                ),
                                 const SizedBox(height: 20),
                                TextFieldWidget(
                                  controller: passwordController,
                                  label: 'Confirm Password',
                                  focusNode: passwordFocus,
                                  obscureText: true,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                ),
                               
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(vertical: 20),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        await _authContoller.isRegister(
                                          usernameController.text.trim(),
                                          emailController.text.trim(),
                                          passwordController.text.trim(),
                                          comPasswordController.text.trim()

                                        );
                                      }
                                    },
                                    child: const Text('Resigister'),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    const Expanded(child: Divider(color: Colors.grey)),
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        'Or',
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                    ),
                                    const Expanded(child: Divider(color: Colors.grey)),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                _loginWithLogo('assets/logo/google_logo.png', 'Continue with Google'),
                                const SizedBox(height: 15),
                                _loginWithLogo('assets/logo/facebook_logo.png' , 'Continue with Facebook'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    
    );
  }
}

Widget _loginWithLogo(String image ,String text) {
  return Container(
    width: double.infinity,
    height: 60,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      border: Border.all(style: BorderStyle.solid),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 30),
        const SizedBox(width: 10),
         Text(text),
      ],
    ),
  );
}