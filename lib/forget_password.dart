import 'package:csr/firebase.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class forgetPassword extends StatefulWidget {
  const forgetPassword({super.key});

  @override
  State<forgetPassword> createState() => _forgetPasswordState();
}

// ignore: camel_case_types
class _forgetPasswordState extends State<forgetPassword> {
   final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
    Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("Reset Password"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'You will Receive an email\n to reset your password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(labelText: "Email"),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: (email) =>
                  //     email != null 
                  //         ? 'Enter a valid email'
                  //         : null,
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: ()async{
                    await AuthService().resetPassword(emailController.text.trim(), context);
                  },
                  icon: Icon(Icons.email_outlined),
                  label: Text(
                    "Reset Pasword",
                    style: TextStyle(fontSize: 24),
                  ),
                )
              ],
            ),
          ),
        ),
      );

}


