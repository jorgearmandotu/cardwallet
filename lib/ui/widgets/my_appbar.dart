import 'package:flutter/material.dart';

class  MyAppBar extends AppBar {
  MyAppBar({String appBarTitle, IconData leadingIcon, BuildContext context}) :super(
    elevation: 0.8,
    backgroundColor:Colors.white,
    centerTitle: true,
    title: Text(
      appBarTitle,
      style:TextStyle(
        color:Colors.black,
        fontSize: 16.0,
        fontWeight:FontWeight.w600),
      ),
      leading:IconButton(
        icon: Icon(
          leadingIcon,
          color:Colors.black,
          size: 15.0,
        ),
        onPressed: (){
        Navigator.pop(context);
        }
      ),
    );
}