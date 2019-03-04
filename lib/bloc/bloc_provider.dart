import 'package:flutter/material.dart';

abstract class  BlocBase {
  void dispose();
}

class BlocProvider<T extends BlocBase> extends StatelessWidget{

}