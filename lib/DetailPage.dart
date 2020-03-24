
import 'package:flutter/material.dart';
import 'PlanetSummary.dart';
import 'Style.dart';
import 'model/Planet.dart';

class DetailPage extends StatelessWidget {

  final Planet planet;

  DetailPage(this.planet);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xFF736AB7),
        child: Stack(
          children: <Widget>[
            _getBackground(planet),
            _getGradient(),
            _getContent(planet),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }
}

Container _getBackground(Planet planet){
  return Container(
    child: Image.asset(
      planet.backgroundImg,
      fit: BoxFit.cover,
      height: 300.0,
    ),
    constraints: BoxConstraints.expand(height: 300.0),
  );
}

Container _getGradient() {
  return Container(
    margin: EdgeInsets.only(top: 190.0),
    height: 110.0,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: <Color>[Color(0x00736AB7), Color(0xFF736AB7)],
        stops: [0.0, 0.9],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(0.0, 1.0),
      )
    ),
  );
}

Widget _getContent(Planet planet){
  final _overviewTitle = "Overview".toUpperCase();
  return ListView(
    padding: EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
    children: <Widget>[
      PlanetSummary(
        planet,
        horizontal: false,
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _overviewTitle,
              style: headerTextStyle(),
            ),
            //Separator(),
            Text(planet.description),
          ],
        ),
      )
    ],
  );
}

Container _getToolbar (BuildContext context){
  return Container(
    margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    child: BackButton(
        color: Colors.white
    ),
  );
}