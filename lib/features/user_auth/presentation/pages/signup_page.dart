import 'package:flutter/material.dart';
import 'package:tiziapp_p1/features/user_auth/authentication.dart';
import 'package:tiziapp_p1/features/user_auth/presentation/pages/home_page.dart';
import 'package:tiziapp_p1/features/user_auth/presentation/pages/login_page.dart';
import 'package:tiziapp_p1/features/user_auth/widget/snack_bar.dart';

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
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  
  

  void despose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  void signUpUser() async {
    String res = await AuthenServ().signUpUser(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );
    if(res == "Success!"){ 
      setState(() {
        isLoading = true;
      });
      //Navigates user to utility screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>const HomePage(),
        ),
      );
    }else { 
      setState(() {
        isLoading = false;
      });
      //Shows error if incorrect format is used
      showSnackBar(context, res);
    }
  }
 
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
                textEditingController: passwordController,
                hintText: "Enter your password",
                isPass: true,
                icon: Icons.lock,
              ),
              ThisButton(onTab: signUpUser, 
              text: "Sign Up"
              ),
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
