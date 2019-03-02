import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/card_model.dart';
import 'dart:convert';
import '../helpers/card_colors.dart';

class CardListBloc{
  BehaviorSubject<List<CardResults>> _cardsCollection =BehaviorSubject<List<CardResults>>();

  List<CardResults> _cardResults;

  //retrieve data from Stream
  Stream<List<CardResults>> get cardList => _cardsCollection.stream;

  void initalData() async {
    var initialData = await rootBundle.loadString('data/initialData.json');
    var decodedJson = jsonDecode(initialData);
    _cardResults = CardModel.fromJson(decodedJson).results;
    for (var i = 0; i< _cardResults.length; i++){
      _cardResults[i].cardColor =CardColor.baseColors[i];
    }
  }

  CardListBloc(){
    initalData();
  }

  void dispose() {
    _cardsCollection.close();
  }
}

final cardListBloc =CardListBloc();