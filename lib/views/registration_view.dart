import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wairso/views/login_view.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({
    super.key,
  });

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final bool firstName = false;
  late bool _obscureText = true;
  final bool correct = false;

  final User newPerson =
      User(email: "", firstName: "", password: "", confirmedPassword: "");

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
          body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 40,
            ),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/registration.jpg",
                  height: 200,
                ),
                const Text(
                  "Sign up",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 3, 17, 119)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (name) {
                    if (name == null || name.isEmpty || name.trim().isEmpty) {
                      return "Please enter a valid name";
                    } else {
                      newPerson.firstName = name;
                    }
                  },
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
                      "First Name",
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
                  height: 20,
                ),
                TextFormField(
                  validator: (email) {
                    if (email == null ||
                        email.isEmpty ||
                        email.trim().isEmpty ||
                        !email.contains("@") ||
                        email.split('@')[0].isEmpty) {
                      return "Please enter a valid email";
                    } else {
                      newPerson.email = email;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
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
                      "Email",
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
                  height: 20,
                ),
                TextFormField(
                  validator: (password) {
                    if (password == null ||
                        password.isEmpty ||
                        password.trim().isEmpty) {
                      return "Please enter a valid password";
                    } else {
                      newPerson.password = password;
                    }
                  },
                  obscuringCharacter: '*',
                  obscureText: _obscureText,
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
                  height: 20,
                ),
                TextFormField(
                  validator: (password) {
                    if (password == null ||
                        password.isEmpty ||
                        password.trim().isEmpty) {
                      return "Please enter a valid password";
                    } else {
                      newPerson.confirmedPassword = password;
                    }
                  },
                  obscuringCharacter: '*',
                  obscureText: _obscureText,
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
                      "Confirm password",
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
                  height: 40,
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
                    _key.currentState?.validate();
                    if (newPerson.password != newPerson.confirmedPassword) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("passwords don't match"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Retry"))
                              ],
                            );
                          });
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => LoginView(
                            person: newPerson,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Sign up",
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
      )),
    );
  }
}

class User {
  late String email;
  late String firstName;
  late String password;
  late String confirmedPassword;
  late bool? isRegistered = false;


  Map<String, String> get userToRegister => {
    "AccountName": "",
    "AccountPassword": "",
    "CustomerName": "",
    "Phone!": "",
    "Email1": "",
  };

  User(
      {required this.email,
      required this.firstName,
      required this.password,
      required this.confirmedPassword});

  String get getPassword => password;
}
