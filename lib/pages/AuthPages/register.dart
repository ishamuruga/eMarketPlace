import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/firebase.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var a = true;
  var email = "";
  var pass = "";
  TextEditingController user = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // void register() async {
  //   try {
  //     await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(email: email, password: pass)
  //         .then((value) => Navigator.pushNamed(context, 'home'));
  //   } on FirebaseAuthException catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text(e.message.toString()),
  //       backgroundColor: Colors.red,
  //     ));
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/register.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 35, top: 135),
                  child: const Text(
                    'Register \n Page',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.45,
                      right: 35,
                      left: 35),
                  child: Column(children: [
                    TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.verified_user_outlined),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "Username",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username is required';
                        }
                        return null;
                      },
                      controller: user,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.email),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      obscureText: a,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            if (a == true) {
                              setState(() {
                                a = false;
                              });
                            } else {
                              setState(() {
                                a = true;
                              });
                            }
                          },
                          icon: a == true
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return 'password shouls contain atleast 6 characteers';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          pass = value;
                        });
                      },
                    ),
                    Row(
                      children: [
                        const Text("Already a User"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "login");
                          },
                          child: const Text(
                            "login",
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          User? result =
                              await AuthService().register(email, pass, context);
                          if (result != null) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text("Registration Success"),
                              backgroundColor: Colors.green,
                            ));
                          }
                        } else {
                          print("not");
                        }
                      },
                      child: const Text("Signin"),
                    ),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
