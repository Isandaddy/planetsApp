import 'package:flutter/material.dart';

import 'model/Planet.dart';

class PlanetSummary extends StatelessWidget {
  final Planet planet;
  final bool horizontal;

  PlanetSummary(this.planet, {this.horizontal= true});
  PlanetSummary.vertical(this.planet) : horizontal = false;
  @override
  Widget build(BuildContext context) {

    final planetCard = Container(
      height: horizontal ? 124.0 : 154.0,
      margin: horizontal ?  EdgeInsets.only(left:  46.0): EdgeInsets.only(top: 72.0),
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
        ? () => print('object')
        //Navigator.of(context).push(
          // PageRouteBuilder(
          //   pageBuilder: (_, __, ___) => DetailPage(planet),
          //   transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child,)
          //   )
        
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
