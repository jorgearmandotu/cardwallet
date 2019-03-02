import 'package:flutter/material.dart';
import '../../models/card_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../bloc/card_list_bloc.dart';

class CardList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final _screenSize =MediaQuery.of(context).size;

    return StreamBuilder<List<CardResults>>(
      stream: cardListBloc.cardList,
      builder: (context, snapshot){
        return Column(
          children: <Widget>[
          snapshot.hasData 
          ? CircularProgressIndicator()
          : SizedBox(
            height: _screenSize.height * 0.8,
            child: Swiper(
              itemBuilder: (BuildContext context, int index){
                return Container();
              },
              itemCount: snapshot.data.length,
              itemWidth: _screenSize.width *0.7,
              itemHeight: _screenSize.height * 0.52,
              layout: SwiperLayout.STACK,
              scrollDirection: Axis.vertical,
            ),
            )
          ],
        );
      },
    );
  }
}

abstract class CardFrontListn extends StatelessWidget{
  final CardResults cardModel = null;
  CardFrontList({dynamic cardModel});

  @override
  Widget build(BuildContext context) {
    final _cardLogo = Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 25.0, right: 52.0,),
          child: Image(
            image: AssetImage('assets/visa_logo.png'),
            width: 65.0,
            height: 32.0,
          ),
          ),
          Padding(padding: EdgeInsets.only(right: 52.0),
          child: Text(
            cardModel.cardType,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.w400
            ),
          ),
          ),
      ],
    );

    final _cardNumber =Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildDats(),
        ],
      ),
    );

    return null;
  }

  Widget _buildDats(){
    List<Widget> dotList = new List<Widget>();
    var counter = 0;
    for (var i = 0; i < 1; i++) {
      counter +=1;
      dotList.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: Container(
            width: 6.0,
            height: 6.0,
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    }
  }

}