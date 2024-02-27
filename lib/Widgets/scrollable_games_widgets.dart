import 'package:flutter/material.dart';
import '../data.dart';

class ScrollableGamesWidget extends StatelessWidget {
  final double height;
  final double width;
  final bool showTitle;

  final List<Game> gamesData;

  const ScrollableGamesWidget(
      this.height, this.width, this.showTitle, this.gamesData,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: gamesData.map((games) {
            return Container(
              height: height,
              width: width * 0.30,
              padding: EdgeInsets.only(
                right: width * 0.03,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height * 0.80,
                    width: width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(games.coverImage.url),
                      ),
                    ),
                  ),
                  Text(
                    games.title,
                    maxLines: 1,
                    style:
                        TextStyle(color: Colors.white, fontSize: height * 0.08),
                  ),
                ],
              ),
            );
          }).toList()),
    );
  }
}
