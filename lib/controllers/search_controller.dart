import 'package:amazon_clone/pages/home/widgets/books_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/book_model.dart';




class SearchController extends GetxController {

  final serachController = TextEditingController();
  final searchclk = false.obs;
  final List<BookModel> Orginalitems = <BookModel>[].obs;
   final List<BookModel> items = <BookModel>[].obs;

 @override
  void onInit() {
    super.onInit();
    fetch();
  }
void fetch(){
  items.assignAll(books);
  Orginalitems.assignAll(items);
}


   void handleSearch() {
      items.assignAll(Orginalitems);
      serachController.text = "";
    }
    
  }


