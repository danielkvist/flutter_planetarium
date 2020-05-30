import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planetarium/utils/planets.dart';
import 'package:planetarium/widgets/planet_card.dart';
import 'package:planetarium/widgets/planet_info_card.dart';
import 'package:planetarium/widgets/planet_slide.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );

    return MaterialApp(
      title: 'Planetarium',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SafeArea(
        child: Scaffold(
          body: Planetarium(),
        ),
      ),
    );
  }
}

class Planetarium extends StatefulWidget {
  @override
  _PlanetariumState createState() => _PlanetariumState();
}

class _PlanetariumState extends State<Planetarium> {
  final PageController _planetController =
      PageController(viewportFraction: 0.5);
  final PageController _planetPageController = PageController();
  double currentPlanet = 0.0;
  bool showPlanetInfo = false;

  @override
  void initState() {
    _planetController.addListener(() {
      setState(() {
        currentPlanet = _planetController.page;
        _planetPageController
            .jumpToPage((_planetController.page + 0.5).toInt());
      });
    });

    _planetPageController.addListener(() {
      setState(() {
        currentPlanet = _planetController.page;
        _planetPageController
            .jumpToPage((_planetController.page + 0.5).toInt());
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black54,
        image: DecorationImage(
          image: AssetImage(
              'assets/images/${planets[(currentPlanet + 0.5).toInt()]}.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _planetPageController,
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (context, index) {
              return PlanetSlide(
                planet: index,
                infoShowing: showPlanetInfo,
                onPressCallback: () {
                  setState(() {
                    showPlanetInfo = !showPlanetInfo;
                  });
                },
              );
            },
          ),
          Align(
            alignment: Alignment.center,
            child: AnimatedOpacity(
              opacity: showPlanetInfo ? 1.0 : 0.0,
              duration: Duration(milliseconds: 200),
              child: PlanetInfoCard(currentPlanet: currentPlanet),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 200,
              child: PageView.builder(
                controller: _planetController,
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return PlanetCard(
                    currentIndex: index,
                    currentPlanet: currentPlanet,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _planetController.dispose();
    _planetPageController.dispose();
    super.dispose();
  }
}
