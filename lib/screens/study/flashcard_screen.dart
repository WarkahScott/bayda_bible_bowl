import 'package:bayda_bible_bowl/utils/menu.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Flashcards extends StatelessWidget {

  Flashcards(this.num);
  final int num;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Menu(),
      body: Center(
        child: Column(
          children: <Widget>[
            CarouselSlider(
                aspectRatio: 1.4,
                viewportFraction: .9,
                enableInfiniteScroll: false,
                height: MediaQuery.of(context).size.height * .75,
                items: List<CardData>.generate(num, (i) => CardData())
            ),
          ],
        ),
      ),
    );
  }
}

class CardData extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width * .9;
    double height = width * 1.4;
    double padV = 20;
    double padH = 20;

    return FlipCard(
      front: Container(
          padding: EdgeInsets.symmetric(horizontal: padH, vertical: padV),
          width: width,
          height: height,
          child: Card(
            child: Center(
                child: Text("Sample question")
            ),
          )
      ),
      back: Container(
          padding: EdgeInsets.symmetric(horizontal: padH, vertical: padV),
          width: width,
          height: height,
          child: Card(
            child: Center(
                child: Text("Sample answer")
            ),
          )
      ),
    );
  }
}