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
    var planet = planets[(currentPlanet + 0.5).toInt()];

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
              planetsInfo[planet]['description'],
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 15,
            ),
            Visibility(
              visible: planetsInfo[planet]['distance'] != '',
              child: Row(
                children: <Widget>[
                  Icon(Icons.place),
                  Text(
                    " ${planetsInfo[planet]['distance']} away.",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 7.5,
            ),
            Visibility(
              visible: planetsInfo[planet]['day'] != '',
              child: Row(
                children: <Widget>[
                  Icon(Icons.access_time),
                  Text(
                    " A day is ${planetsInfo[planet]['day']}.",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 7.5,
            ),
            Visibility(
              visible: planetsInfo[planet]['year'] != '',
              child: Row(
                children: <Widget>[
                  Icon(Icons.calendar_today),
                  Text(
                    " A year is ${planetsInfo[planet]['year']}.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
