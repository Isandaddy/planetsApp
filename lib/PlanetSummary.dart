import 'package:flutter/material.dart';

import 'DetailPage.dart';
import 'Style.dart';
import 'model/Planet.dart';

class PlanetSummary extends StatelessWidget {
  final Planet planet;
  final bool horizontal;

  PlanetSummary(this.planet, {this.horizontal= true});
  PlanetSummary.vertical(this.planet) : horizontal = false;
  @override
  Widget build(BuildContext context) {

    Widget _planetValue({String value, String image}) {
      return Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(image, height: 12.0,),
            Container(width: 8.0,),
            Text(
              value == planet.gravity ? planet.gravity : planet.distance, style: regularTextStyle(),
            )
          ],
        ),
      );
    }

    final planetCardContent =Container(
      margin: EdgeInsets.fromLTRB(
          horizontal ? 76.0 : 16.0 ,  horizontal ? 16.0 : 42.0, 16.0, 16.0
      ),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment:
        horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          Container(height: 4.0),
          Text(planet.name, style: headerTextStyle(),),
          Container(height: 10.0),
          Text(planet.location , style: subHeaderTextStyle(),),
          Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              width: 18.0,
              color: Color(0xff00c6ff),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: horizontal ? 1 : 0,
                child: _planetValue(
                  value: planet.distance,
                  image: 'assets/img/ic_distance.png'
                ),
              ),
              Container(
                width: 32.0,
              ),
              Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _planetValue(
                      value: planet.gravity,
                      image: 'assets/img/ic_gravity.png')
              ),
            ],
          ),
        ],
      )
    );

    final planetCard = Container(
      height: horizontal ? 124.0 : 154.0,
      margin: horizontal ?  EdgeInsets.only(left:  46.0): EdgeInsets.only(top: 72.0),
      child: planetCardContent,
      decoration: BoxDecoration(
        color: Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ]
      ),
    );

    return GestureDetector(
      onTap: horizontal 
        ? () =>
        Navigator.of(context).push(
           PageRouteBuilder(
             pageBuilder: (_, __, ___) => DetailPage(planet),
             transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child,)
             )
        )
        : null,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: <Widget>[
            planetCard,
          ],
        ),
      ),
    );
  }
}
