import 'dart:convert';
import 'package:cannabis/Db/Config.dart';


import 'package:cannabis/Page/Login.dart';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _obscureText = true;
  bool? isChecked = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 77)),
              Image(image: AssetImage('lib/assets/logo.png')),
              Text(
                'Create Your',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Account',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w400)),
              SizedBox(
                height: 35,
              ),
              SizedBox(
                width: 315,
                height: 56,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    errorText: _isNotValidate ? "Enter Proper Info" : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(width: 19),
                    ),
                    labelText: 'Email Address',
                    labelStyle: TextStyle(color: Color(0xff81AA66)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff81AA66)),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 315,
                height: 56,
                child: TextField(
                  controller: passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    errorText: _isNotValidate ? "Enter Proper Info" : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(width: 19),
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Color(0xff81AA66)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff81AA66)),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      color: _obscureText ? Colors.blueGrey : Color(0xff81AA66),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 30)),
                  Checkbox(
                    value: isChecked,
                    activeColor: Colors.blueGrey,
                    onChanged: (newBool) {
                      setState(() {
                        isChecked = newBool;
                      });
                    },
                  ),
                  Container(
                    width: 279,
                    child: Text(
                      'By creating an account you agree with our terms and conditions',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 42,
              ),
              GestureDetector(
                onTap: () {
                  registerUser();
                },
                child: Container(
                  height: 48,
                  width: 315,
                  decoration: BoxDecoration(color: Color(0xff81AA66)),
                  child: Center(
                    child: Text(
                      'Create an account',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 42,
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(45)),
                  Text('Already a member?',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey)),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    child: Text('Log in ',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff81AA66))),
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: Login(),
                              type: PageTransitionType.rightToLeft));
                    },
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  // API
  void registerUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var regBody = {
        "email": emailController.text,
        "password": passwordController.text
      };

      var response = await http.post(Uri.parse(registration),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody));

      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status']) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: Container(
              padding: EdgeInsets.all(16),
              height: 90,
              decoration: BoxDecoration(
                color: Color(0xff81AA66),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'WOW',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('You have successfully registered',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        );
        Future.delayed(Duration(seconds: 4), () {
          Navigator.push(
              context,
              PageTransition(
                  child: Login(),
                  type: PageTransitionType.rightToLeft));
        });
      }
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }
}
