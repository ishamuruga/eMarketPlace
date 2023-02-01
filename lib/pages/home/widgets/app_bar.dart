import 'package:flutter/material.dart';

import '../../../constants.dart';

AppBar buildAppBar() => AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: Image.asset(
        'assets/images/Logo_Shop.jpg',
        height: 100,
        width: 100,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(Constants.kPadding),
        ),
        Container(
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/profile.jpg"),
            radius: 22,
          ),
          padding: EdgeInsets.all(5),
        )
      ],
    );
