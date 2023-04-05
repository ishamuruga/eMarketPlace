import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Dashboard")),
      body: Stack(
        children: [
           Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/admin.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
          Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              child: const Text(
                "Welcome to Admin Dashboard",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "dismer");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.height / 6,
                    margin: EdgeInsets.only(top: 100, left: 30),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade700,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: const [
                        Text(
                          "List Merchants",
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.center,
                        ),
                        Icon(Icons.face)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                   onTap: () {
                    Navigator.pushNamed(context, "discus");
                   },
                  child: Container(
                    width: MediaQuery.of(context).size.height / 6,
                    margin: const EdgeInsets.only(top: 100, right: 30),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade900,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: const [
                        Text(
                          "List Customers",
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.center,
                        ),
                        Icon(Icons.person_search)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.height / 6,
                    margin: EdgeInsets.only(top: 60, left: 30),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade900,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: const [
                        Text(
                          "Approve Merchants",
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.center,
                        ),
                        Icon(Icons.check_circle)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.height / 6,
                    margin: EdgeInsets.only(top: 60, right: 30),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade700,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: const [
                        Text(
                          "Back to Login",
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.center,
                        ),
                        Icon(Icons.exit_to_app)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        ]
      ),
    );
  }
}
