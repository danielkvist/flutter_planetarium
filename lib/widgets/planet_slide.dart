import 'package:flutter/material.dart';
import 'package:planetarium/utils/capitalize.dart';
import 'package:planetarium/utils/planets.dart';

class PlanetSlide extends StatelessWidget {
  final int planet;
  final bool infoShowing;
  final Function() onPressCallback;

  PlanetSlide({
    @required this.planet,
    @required this.infoShowing,
    @required this.onPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(25.0),
          child: Text(
            capitalize(planets[planet]),
            style: TextStyle(
              color: Colors.white,
              fontSize: 32.0,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: IconButton(
            icon: Icon(
              infoShowing ? Icons.info : Icons.info_outline,
            ),
            onPressed: onPressCallback,
          ),
        ),
      ],
    );
  }
}
