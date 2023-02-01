import 'package:amazon_clone/constants.dart';
import 'package:amazon_clone/models/book_model.dart';
import 'package:flutter/material.dart';

class BuildnewBook extends StatelessWidget {
  final List<BookModel> newBook = BookModel.newBooks;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 2 * Constants.kPadding,
            vertical: Constants.kPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hot New Releases",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Icon(Icons.keyboard_arrow_right),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              newBook.length,
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
                            newBook[index].image,
                            height: 180,
                            width: 300,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        width: 120,
                        child: Text(
                          newBook[index].title,
                        ),
                      ),
                      Container(
                        width: 120,
                        child: Text(
                          newBook[index].subtitle,
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
    );
  }
}
