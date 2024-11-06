import 'package:flutter/material.dart';
import 'package:tiziapp_p1/features/user_auth/presentation/pages/login_page.dart';

import '../../widget/button.dart';
import '../../widget/text_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: height / 2.8,
                child: Image.asset("images/playstore.png"),
              ),
              TextFieldIn(
                textEditingController: nameController,
                hintText: "Enter your username",
                icon: Icons.person,
              ),
              TextFieldIn(
                textEditingController: emailController,
                hintText: "Enter your email",
                icon: Icons.email,
              ),
              TextFieldIn(
                textEditingController: passController,
                hintText: "Enter your password",
                icon: Icons.lock,
              ),
              ThisButton(onTab: (){

              }, text: "Sign Up"),
              SizedBox(height: height/15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?", 
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.purple,
                    ),
                  ),
                  GestureDetector(
                    onTap:() {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context)=> const LoginPage(),
                        ),
                      );
                  },
                  child: const Text(
                    "Log In", 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.purple,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
