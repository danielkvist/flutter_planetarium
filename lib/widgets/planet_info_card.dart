import 'package:flutter/material.dart';
import 'package:planetarium/utils/planets.dart';

class PlanetInfoCard extends StatelessWidget {
  const PlanetInfoCard({
    Key key,
    @required this.currentPlanet,
  }) : super(key: key);

  final double currentPlanet;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Text(
              planetsInfo[planets[(currentPlanet + 0.5).toInt()]]
                  ['description'],
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                Icon(Icons.place),
                Text(
                  " ${planetsInfo[planets[(currentPlanet + 0.5).toInt()]]['distance']} away.",
                ),
              ],
            ),
            SizedBox(
              height: 7.5,
            ),
            Row(
              children: <Widget>[
                Icon(Icons.access_time),
                Text(
                  " A day is ${planetsInfo[planets[(currentPlanet + 0.5).toInt()]]['day']}.",
                ),
              ],
            ),
            SizedBox(
              height: 7.5,
            ),
            Row(
              children: <Widget>[
                Icon(Icons.calendar_today),
                Text(
                  " A year is ${planetsInfo[planets[(currentPlanet + 0.5).toInt()]]['year']}.",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
