import 'package:amazon_clone/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/search_controller.dart';

void handleSearch(text) {
    var filterData = controller.Orginalitems.where((element) =>
        element.subtitle.toLowerCase().contains(text.toString().toLowerCase()) ||
        element.title.toLowerCase().contains(text.toString().toLowerCase()));
    controller.items.assignAll(filterData);
  }

final controller = Get.put(SearchController());
Widget buildSearchBar() => Padding(
      padding: EdgeInsets.all(2 * Constants.kPadding),
      child: TextField(
        autofocus: true,
            controller: controller.serachController,
            onChanged: (text) {
              handleSearch(text);
            },
        decoration: InputDecoration(
          hintText: "Search a Valid Book",
          fillColor: Colors.black.withOpacity(0.2),
          filled: true,
          prefixIcon: Icon(Icons.search),
          suffixIcon: IconButton(onPressed:(){controller.handleSearch();}, icon: Icon(Icons.cancel)),
          contentPadding: EdgeInsets.symmetric(
            vertical: 0.0,
            horizontal: Constants.kPadding,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
