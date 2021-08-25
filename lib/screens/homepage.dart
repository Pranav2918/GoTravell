import 'package:flutter/material.dart';
import 'package:flutter_webdesign/widgets/appbar.dart';
import 'package:flutter_webdesign/widgets/bottombar.dart';
import 'package:flutter_webdesign/widgets/carousel.dart';
import 'package:flutter_webdesign/widgets/featuredpost.dart';
import 'package:flutter_webdesign/widgets/floatingCard.dart';
import 'package:flutter_webdesign/utils/responsive.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imgUrl =
      "https://images.unsplash.com/flagged/photo-1569072263041-68e678eededb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1867&q=80";
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 1000),
          child: ResponsiveWidget.isSmallScreen(context)
              ? NavMobile()
              : ResponsiveWidget.isMediumScreen(context)
                  ? NavTab()
                  : NavBar()),
      body: SingleChildScrollView(
          child: Stack(
        children: <Widget>[
          Container(
            width: screenSize.width,
            height: screenSize.height * 0.45,
            child: Image.network(imgUrl, fit: BoxFit.cover),
          ),
          Container(
            margin: EdgeInsets.only(top: screenSize.height * 0.42),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveWidget.isSmallScreen(context)
                    ? SmallFloatingCard()
                    : Center(
                        heightFactor: 1,
                        child: Padding(
                            padding: EdgeInsets.only(
                              left: screenSize.width / 5,
                              right: screenSize.width / 5,
                            ),
                            child: floatingCard(context)),
                      ),
                ResponsiveWidget.isSmallScreen(context)
                    ? Container(
                        margin: EdgeInsets.only(top: 15, left: 25, right: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Featured',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                )),
                            Text('Unique wildlife tours & destinations',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ))
                          ],
                        ))
                    : Container(
                        margin: EdgeInsets.only(left: 35, right: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Featured',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                )),
                            Text('Unique wildlife tours & destinations',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                ))
                          ],
                        ),
                      ),
                Container(
                    margin: ResponsiveWidget.isLargeScreen(context)
                        ? EdgeInsets.only(left: 35, right: 35)
                        : null,
                    child: FeaturedPost()),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text('Destination Diversity',
                        style: TextStyle(
                            color: Colors.teal.withOpacity(0.5),
                            fontSize: 25,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
                SizedBox(height: 20),
                CarouselWidget(),
                SizedBox(height: 20),
                ResponsiveWidget.isSmallScreen(context)
                    ? SmallBottomBar()
                    : BottomBar(),
              ],
            ),
          )
        ],
      )),
    );
  }
}
