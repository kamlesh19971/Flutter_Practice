import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';


class LoginPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(  
          children: [
            Image.asset("assets/images/login_image.png", fit: BoxFit.cover),
            const SizedBox(height: 20),
            const Text(
              "Welcome",
              style: TextStyle( fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children:  [
                  const TextField(
                    decoration: InputDecoration( hintText: "Enter Username", labelText: "Username"),
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration( hintText: "Enter Password", labelText: "Password", ),
                  ),
      
                  const SizedBox(height: 40),
      
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    }, 
                    style: TextButton.styleFrom(minimumSize: Size(150, 50)),
                    child: const Text("Login"),
                  )
                ]
              ),
            )
            
          ],
        ),
      )
    );
  }
}