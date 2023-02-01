import 'package:amazon_clone/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../controllers/search_controller.dart';

final List<BookModel> books = BookModel.books;


class BuildBookList extends StatelessWidget {
  final controller = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return GetX<SearchController>(
      
      builder: (controller) {
        return Container(
          width: double.infinity,
          color: Colors.black.withOpacity(0.1),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Constants.kPadding,
                    horizontal: Constants.kPadding * 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Best Sellers",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("See all"),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: Constants.kPadding),
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        minimumSize: Size(5, 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    controller.items.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(
                        bottom: 2 * Constants.kPadding,
                        right: Constants.kPadding,
                        left: index == 0 ? Constants.kPadding : 0,
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 4,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  controller.items[index].image,
                                  height: 180,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              width: 120,
                              child: Text(
                                controller.items[index].title,
                              ),
                            ),
                            Container(
                              width: 120,
                              child: Text(
                                books[index].subtitle,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}