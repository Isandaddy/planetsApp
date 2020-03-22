import 'package:flutter/material.dart';
import 'PlanetSummary.dart';
import 'model/Planet.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(0xFF736AB7),
        child: CustomScrollView(
          //scroll방향지정 vertical수직
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                sliver: SliverFixedExtentList(
                  //delegate 자식제어 속성
                  //SliverChildBuilderDelegate ListView.builder와 비숫한 친구
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => PlanetSummary(planets[index]),
                        childCount: planets.length,

                    ),
                    itemExtent: 152.0
                ),
            ),
          ],
        ),
      ),
    );
  }
}
