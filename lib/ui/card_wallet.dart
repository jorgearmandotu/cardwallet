import 'package:flutter/material.dart';
import '../ui/widgets/card_front.dart';
import '../ui/widgets/my_appbar.dart';
import '../ui/app.dart';
import '../bloc/card_bloc.dart';
import '../bloc/bloc_provider.dart';

class CardWallet extends StatefulWidget {
  @override
  _CardWallet createState() => _CardWallet();
}

class _CardWallet extends State<CardWallet> with TickerProviderStateMixin {
  AnimationController rotateController;
  AnimationController opacityController;
  Animation<double> animation;
  Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();
    final CardBloc bloc =BlocProvider.of<CardBloc>(context);
    rotateController =AnimationController(
      vsync: this, duration: new Duration(milliseconds: 300)
    );
    opacityController =AnimationController(
      vsync: this, duration: new Duration(milliseconds: 2000)
    );

    CurvedAnimation curvedAnimation = new CurvedAnimation(
      parent: opacityController, curve: Curves.fastOutSlowIn
    );

    animation = Tween(begin: -2.0, end: -3.15).animate(rotateController);
    opacityAnimation =Tween(begin: 0.0, end: 1.0).animate(curvedAnimation);

    opacityAnimation.addStatusListener((status){
      if(status ==AnimationStatus.completed) {
        bloc.saveCard();
        Navigator.push(context, MaterialPageRoute(builder: (context) => App()));
      }
    });

    rotateController.forward();
    opacityController.forward();
  }

  @override
  void dispose() {
    rotateController.dispose();
    opacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize =MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(
        appBarTitle: 'Wallet',
        leadingIcon: Icons.arrow_back,
        context: context,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: AnimatedBuilder(
                animation: animation,
                child: Container(
                  width: _screenSize.width / 1.5,
                  height: _screenSize.height / 1.8,
                  child: CardFront(rotatedTurnsValue: -3),
                ),
                builder: (context, _widget){
                  return Transform.rotate(
                    angle: animation.value,
                    child: _widget,
                  );
                },
              ),
            ),
            SizedBox(
              height: 50.0
              ),
              CircularProgressIndicator(
                strokeWidth: 6.0,
                backgroundColor: Colors.lightBlue,
              ),
              SizedBox(
                height: 30.0,
              ),
              FadeTransition(
                opacity: opacityAnimation,
                child: Text(
                  'Card Added',
                  style:TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 16.0,
                    fontWeight:FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}