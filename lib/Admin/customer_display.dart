import 'package:csr/firebase.dart';
import 'package:flutter/material.dart';

class customerDisplay extends StatefulWidget {
  const customerDisplay({super.key});

  @override
  State<customerDisplay> createState() => _customerDisplayState();
}

class _customerDisplayState extends State<customerDisplay> {
  List<Map<String, dynamic>> _userDataList = [];
  @override
  void initState() {
    super.initState();
    _getUserDataListByName('cus');
  }

  Future<void> _getUserDataListByName(String name) async {
    List<Map<String, dynamic>> userDataList =
        await AuthService().getUserDataListByName(name);
    setState(() {
      _userDataList = userDataList;
    });
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Customer List'),
    ),
    body: _userDataList.isNotEmpty
        ? ListView.builder(
            itemCount: _userDataList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(_userDataList[index]['name']),
                  subtitle: Text(_userDataList[index]['address']),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    print("Customer details");
                  },
                ),
              );
            },
          )
        : const Center(
            child: CircularProgressIndicator(),
          ),
  );
}
}
