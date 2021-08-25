import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webdesign/utils/responsive.dart';

final List<String> places = [
  "assets/delhi.jpg",
  "assets/mumbai.jpg",
  "assets/junagadh.jpg",
  "assets/kashmir.jpg",
  "assets/manali.jpg"
];
final List<String> name = ['Delhi', 'Mumbai', 'Junagadh', 'Kashmir', 'Manali'];

List<Widget> generateImageTiles(screenSize) {
  return places
      .map(
        (element) => ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            element,
            fit: BoxFit.cover,
          ),
        ),
      )
      .toList();
}

class CarouselWidget extends StatefulWidget {
  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _currentPage = 0;
  CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);
    return Container(
      child: Stack(
        children: [
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
                enlargeCenterPage: true,
                height: ResponsiveWidget.isLargeScreen(context)
                    ? 650
                    : ResponsiveWidget.isMediumScreen(context)
                        ? 400
                        : 250,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentPage = index;
                  });
                }),
            carouselController: _controller,
          ),
          AspectRatio(
            aspectRatio: 19 / 8,
            child: Center(
              child: Text(
                name[_currentPage],
                style: TextStyle(
                  letterSpacing: 8,
                  fontSize: screenSize.width / 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
