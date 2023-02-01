import 'package:amazon_clone/pages/home/widgets/app_bar.dart';
import 'package:amazon_clone/pages/home/widgets/books_list.dart';
import 'package:amazon_clone/pages/home/widgets/header.dart';
import 'package:amazon_clone/pages/home/widgets/icons_list.dart';
import 'package:amazon_clone/pages/home/widgets/new_book.dart';
import 'package:amazon_clone/pages/home/widgets/search_bar.dart';
import 'package:flutter/material.dart';

import '../../services/firebase.dart';


class HomePage extends StatefulWidget {
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void logout() async{
      await AuthService().googleSignOut();
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, 'login');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(onPressed: (){logout();}, icon: const Icon(Icons.logout)),
          ...buildHeader(),
          buildSearchBar(),
          buildIconsList(),
          BuildBookList(),
          BuildnewBook()
        ],
      )),
    );
  }
}
