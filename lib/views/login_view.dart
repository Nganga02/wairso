import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;


import 'package:wairso/views/registration_view.dart';
import 'package:wairso/views/schools.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key, required User? person});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late bool _obscureText = true;
  late bool _isWaiting = false;

  //Creating a globalKey
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

   void _uploadUser(BuildContext context, Map<String, String> loginCredentials) async {
    try {
      final url = Uri.https("wsa-skxu.onrender.com", "/user/login");
      final response = await http.post(url, body:
      loginCredentials
      );
      if(response.statusCode == 201){
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (ctx) =>  SchoolView(userCredentials:  jsonDecode(response.body)),
            ),(Route<dynamic> route) => false
        );
      }else{
        print(response.statusCode);
      }
    }catch(error) {
      print(error.toString());
    }
  }

  late UserToLogin user = UserToLogin(email: "", password: "");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/login.jpg",
                    height: 250,
                  ),
                  const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 3, 17, 119)),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    validator: (email) {
                      if (email == null ||
                          email.isEmpty ||
                          email.trim().isEmpty ||
                          !email.contains("@") ||
                          email.split('@')[0].isEmpty) {
                        return "Please enter a valid email";
                      } else {
                        user.email = email;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: _email,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 100, 100, 100),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 26, 145, 211),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      label: const Text(
                        "Email or username",
                        style: TextStyle(
                          color: Color.fromARGB(255, 26, 145, 211),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).colorScheme.onErrorContainer),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (password) {
                      if (password == null ||
                          password.isEmpty ||
                          password.trim().isEmpty) {
                        return "Please enter a valid password";
                      } else {
                        user.password = password;
                      }
                    },
                    keyboardType: TextInputType.text,
                    obscureText: _obscureText,
                    controller: _password,
                    decoration: InputDecoration(
                      suffixIcon: SizedBox(
                        width: 48,
                        child: Center(
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: FaIcon(
                                _obscureText
                                    ? FontAwesomeIcons.eyeSlash
                                    : FontAwesomeIcons.solidEye,
                                size: 16,
                              )),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 100, 100, 100),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 26, 145, 211),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      label: const Text(
                        "Password",
                        style: TextStyle(
                          color: Color.fromARGB(255, 26, 145, 211),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).colorScheme.onErrorContainer),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(100, 40),
                      maximumSize: const Size(100, 40),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      side: const BorderSide(
                        width: 2,
                        color: Color.fromARGB(255, 26, 145, 211),
                      ),
                      textStyle: const TextStyle(
                        color: Color.fromARGB(255, 26, 145, 211),
                      ),
                    ),
                    onPressed: () {
                      _formKey.currentState!.validate();
                      setState(() {
                        _isWaiting = true;
                      });
                      _uploadUser(context, user.userMap);
                    },
                    child: _isWaiting? const CircularProgressIndicator(
                      color: Color.fromARGB(255, 26, 145, 211),
                    ): const Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 26, 145, 211),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class UserToLogin{
  late String email;
  late String password;

  Map<String, String> get userMap => {
    "UserEmail": email,
    "UserPassword": password,
  };

  UserToLogin({required this.email, required this.password});
}