import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Text(
              "Welcome back,\nYour wellness journey awaits.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.purple
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}