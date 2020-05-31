import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_splash/flutter_splash.dart';
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
      home: Splash(
        seconds: 1,
        title: Text(
          '\n\nPlanetarium',
          style: TextStyle(
            fontSize: 42.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        imageBackground: Image.asset('assets/images/earth.jpg').image,
        backgroundColor: Colors.black,
        loaderColor: Colors.white,
        navigateAfterSeconds: SafeArea(
          child: Scaffold(
            body: Planetarium(),
          ),
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
      PageController(viewportFraction: 0.5, initialPage: 3);
  final PageController _planetPageController = PageController(initialPage: 3);
  double currentPlanet = 3;
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
            itemCount: planets.length,
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
                itemCount: planets.length,
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
