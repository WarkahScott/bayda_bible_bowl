import 'package:bayda_bible_bowl/utils/menu.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Study extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Study'),
      ),
      drawer: Menu(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CarouselSlider(
              enableInfiniteScroll: false,
              height: MediaQuery.of(context).size.height * .8,
              items: List<FlipCard>.generate(10, (i) {return FlipCard(
                front: Container(
                    decoration: BoxDecoration(/*color: Colors.black12, */shape: BoxShape.rectangle,/* borderRadius: BorderRadius.circular(10)*/),
                    width: MediaQuery.of(context).size.width * .8,
                    child: Card(child: Text("Sample question"))),
                back: Container(
                    decoration: BoxDecoration(/*color: Colors.black12,*/ shape: BoxShape.rectangle,/* borderRadius: BorderRadius.circular(10)*/),
                    width: MediaQuery.of(context).size.width * .8,
                    child: Card(child: Text("Sample question"))),
              );})
            ),
          ],
        ),
      ),
    );
  }
}