import 'package:flutter/material.dart';
import '../data.dart';

class ScrollableGamesWidget extends StatelessWidget {
  final double height;
  final double width;
  final bool showTitle;

  final List<Game> gamesData;

  const ScrollableGamesWidget(
      this.height, this.width, this.showTitle, this.gamesData, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: gamesData.map((games) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment(height * 0.15,width),
                    height: height * 0.80,
                    width: width * 0.30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(games.coverImage.url),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList()),
    );
  }
}
