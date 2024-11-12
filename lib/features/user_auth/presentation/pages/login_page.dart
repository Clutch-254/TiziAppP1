import 'package:flutter/material.dart';
import 'package:tiziapp_p1/features/user_auth/presentation/pages/signup_page.dart';
import 'package:tiziapp_p1/features/user_auth/widget/button.dart';
import 'package:tiziapp_p1/features/user_auth/widget/text_field.dart';

import '../../authentication.dart';
import '../../widget/snack_bar.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

   void despose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUsers() async {
    String res = await AuthenServ().loginUser(
      email: emailController.text,
      password: passwordController.text,
    );
    //if the log in process is successful user has accessed their account
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
                height: height / 2.7,
                child: Image.asset("images/playstore.png"),
              ),
              TextFieldIn(
                textEditingController: emailController,
                hintText: "Enter your email",
                icon: Icons.email
              ),
              TextFieldIn(
                isPass: true,
                textEditingController: passwordController,
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
              ThisButton(onTab: loginUsers,
               text: "Log In",
              ),
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
