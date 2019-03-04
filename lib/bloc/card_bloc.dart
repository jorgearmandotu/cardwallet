import 'dart:async';
import 'package:rxdart/rxdart.dart';

class CardBloc{
  BehaviorSubject<String> _cardType =BehaviorSubject<String>();

  //Add data stream
  Function(String) get selectCardType => _cardType.sink.add;

  //retrive data from stream
  Stream<String> get cardType => _cardType.stream;

  void dispose(){
    _cardType.close();
  }
}