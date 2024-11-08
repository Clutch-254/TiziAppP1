import 'package:flutter/material.dart';
import 'package:tiziapp_p1/features/user_auth/presentation/pages/signup_page.dart';
import 'package:tiziapp_p1/features/user_auth/widget/button.dart';
import 'package:tiziapp_p1/features/user_auth/widget/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                height: height / 2.7,
                child: Image.asset("images/playstore.png"),
              ),
              TextFieldIn(
                textEditingController: emailController,
                hintText: "Enter your email",
                icon: Icons.email
              ),
              TextFieldIn(
                textEditingController: passController,
                hintText: "Enter your password",
                icon: Icons.lock,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.purple,
                  ),
                 ),
                ),
              ),
              ThisButton(onTab: (){}, text: "Log In"),
              SizedBox(height: height/15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?", 
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
                          builder: (context)=> const SignupPage(),
                        ),
                      );
                  },
                  child: const Text(
                    "Sign Up", 
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
