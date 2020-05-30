import 'package:flutter/material.dart';
import 'package:planetarium/utils/planets.dart';

class PlanetCard extends StatelessWidget {
  final int currentIndex;
  final double currentPlanet;

  PlanetCard({
    this.currentIndex,
    this.currentPlanet,
  });

  @override
  Widget build(BuildContext context) {
    double relativePosition = currentIndex - currentPlanet;

    return Container(
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.003)
          ..scale((1 - relativePosition.abs()).clamp(0.2, 0.6) + 0.4)
          ..rotateY(relativePosition),
        alignment: relativePosition >= 0
            ? Alignment.centerLeft
            : Alignment.centerRight,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 25,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black,
          ),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/${planets[currentIndex]}.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
