import 'package:amazon_clone/constants.dart';
import 'package:flutter/material.dart';

List<Widget> buildHeader() => [
      Padding(
        padding: EdgeInsets.only(
          left: 2 * Constants.kPadding,
          top: Constants.kPadding,
        ),
        child: Text(
          "Bookshelf",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 2 * Constants.kPadding,
          vertical: Constants.kPadding,
        ),
        child: Text(
          "Welcome Shopping Books",
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
    ];
