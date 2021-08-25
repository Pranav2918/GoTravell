import 'package:flutter/material.dart';
import 'package:flutter_webdesign/utils/responsive.dart';

// ignore: must_be_immutable
class FeaturedPost extends StatelessWidget {
  List<String> featuredImages = [
    "https://images.pexels.com/photos/5625819/pexels-photo-5625819.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.unsplash.com/photo-1564349683136-77e08dba1ef7?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YW5pbWFsc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1554080353-321e452ccf19?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHBob3RvZ3JhcGh5fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
  ];
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, top: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //Trecking
            Column(
              children: [
                Container(
                  width: ResponsiveWidget.isLargeScreen(context) ? 470 : 270,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      featuredImages[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height / 70,
                    ),
                    child: Text(
                      'Trecking',
                      style: TextStyle(
                        fontSize: ResponsiveWidget.isSmallScreen(context)
                            ? 12
                            : ResponsiveWidget.isMediumScreen(context)
                                ? 14
                                : 16,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
              ],
            ),
            SizedBox(width: 25),
            //Safari
            Column(
              children: [
                Container(
                  width: ResponsiveWidget.isLargeScreen(context) ? 470 : 270,
                  // height: screenSize.width / 6,
                  // width: screenSize.width / 3.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      featuredImages[1],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height / 70,
                    ),
                    child: Text(
                      'Safari',
                      style: TextStyle(
                        fontSize: ResponsiveWidget.isSmallScreen(context)
                            ? 12
                            : ResponsiveWidget.isMediumScreen(context)
                                ? 14
                                : 16,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
              ],
            ),
            SizedBox(width: 25),
            // //Photography
            Column(
              children: [
                Container(
                  width: ResponsiveWidget.isLargeScreen(context) ? 470 : 270,
                  // height: screenSize.width / 6,
                  // width: screenSize.width / 3.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      featuredImages[2],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height / 70,
                    ),
                    child: Text(
                      'Photography',
                      style: TextStyle(
                        fontSize: ResponsiveWidget.isSmallScreen(context)
                            ? 12
                            : ResponsiveWidget.isMediumScreen(context)
                                ? 14
                                : 16,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
