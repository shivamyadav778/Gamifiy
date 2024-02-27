import '../Widgets/scrollable_games_widgets.dart';
import 'package:flutter/material.dart';
import '../data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _deviceHeight;
  var _deviceWidth;
  var _selectedgame;

  @override
  void initState() {
    super.initState();
    _selectedgame = 0;
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          featuredGameWidget(),
          gradientBoxWidget(),
          topLayerpicture(),
        ],
      ),
    );
  }

  Widget featuredGameWidget() {
    return SizedBox(
        height: _deviceHeight * 0.50,
        width: _deviceWidth,
        child: PageView(
          onPageChanged: (index) {
            setState(() {
              _selectedgame = index;
            });
          },
          scrollDirection: Axis.horizontal,
          children: featuredGames.map((game) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(game.coverImage.url),
                ),
              ),
            );
          }).toList(),
        ));
  }

  Widget gradientBoxWidget() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: _deviceHeight * 0.80,
          width: _deviceWidth,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(35, 45, 59, 1.0),
                Colors.transparent,
              ],
              stops: [0.65, 1.0],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ));
  }

  Widget topLayerpicture() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: _deviceWidth * 0.05, vertical: _deviceHeight * 0.005),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          topbarwidget(),
          SizedBox(height: _deviceHeight * 0.13),
          featuredGameInfo(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.01),
            child: ScrollableGamesWidget(
                _deviceHeight * 0.24, _deviceWidth, true, games),
          ),
          featuredGameBannerWidget(),
        ],
      ),
    );
  }

  Widget topbarwidget() {
    return SizedBox(
      height: _deviceHeight * 0.18,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          Row(
            children: [
              const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: _deviceWidth * 0.03,
              ),
              const Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget featuredGameInfo() {
    return SizedBox(
      height: _deviceHeight * 0.12,
      width: _deviceWidth,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            featuredGames[_selectedgame].title,
            style:
                TextStyle(color: Colors.white, fontSize: _deviceHeight * 0.035),
          ),
          SizedBox(height: _deviceHeight * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: featuredGames.map((games) {
              bool isActive = games.title == featuredGames[_selectedgame].title;
              double circleradius = _deviceHeight * 0.005;
              return Container(
                margin: EdgeInsets.only(right: _deviceWidth * 0.015),
                height: circleradius * 2,
                width: circleradius * 2,
                decoration: BoxDecoration(
                  color: isActive ? Colors.green : Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget featuredGameBannerWidget() {
    return Container(
      height: _deviceHeight * 0.13,
      width: _deviceWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            fit: BoxFit.cover,
        image: NetworkImage(featuredGames[3].coverImage.url),
      ),
      ),
    );
  }
}
