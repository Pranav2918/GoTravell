import 'package:flutter/material.dart';
import 'package:flutter_webdesign/widgets/bottombarColmn.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      color: Colors.blueGrey[900],
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomBarColumn(
                heading: 'ABOUT',
                s1: 'Contact Us',
                s2: 'About Us',
                s3: 'Careers',
              ),
              BottomBarColumn(
                heading: 'HELP',
                s1: 'Payment',
                s2: 'Cancellation',
                s3: 'FAQ',
              ),
              BottomBarColumn(
                heading: 'SOCIAL',
                s1: 'Twitter',
                s2: 'Facebook',
                s3: 'YouTube',
              ),
              Container(
                color: Colors.blueGrey,
                width: 2,
                height: 150,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoText(
                    type: 'Email',
                    text: 'pranavdaveofficial@gmail.com',
                  ),
                  SizedBox(height: 5),
                  InfoText(
                    type: 'Address',
                    text: 'Junagadh, Gujarat',
                  )
                ],
              ),
            ],
          ),
          Divider(
            color: Colors.blueGrey,
          ),
          SizedBox(height: 20),
          Text(
            'Copyright © 2021 | PRANAV DAVE',
            style: TextStyle(
              color: Colors.blueGrey[300],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class InfoText extends StatelessWidget {
  final String type;
  final String text;

  InfoText({required this.type, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$type: ',
          style: TextStyle(
            color: Colors.blueGrey[300],
            fontSize: 16,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.blueGrey[100],
            fontSize: 16,
          ),
        )
      ],
    );
  }
}

class SmallBottomBar extends StatefulWidget {
  @override
  _SmallBottomBarState createState() => _SmallBottomBarState();
}

class _SmallBottomBarState extends State<SmallBottomBar> {
  final String github = "https://github.com/Pranav2918";
  final String linkedin = "https://www.linkedin.com/in/pranav-dave-3a56931ba/";
  List isHovered = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        color: Colors.black,
        child: Container(
          margin: EdgeInsets.only(left: 25, right: 25, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'About Me',
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      data(Icon(Icons.person, color: Colors.white, size: 15),
                          'Pranav Dave'),
                      SizedBox(height: 5),
                      data(Icon(Icons.mail, color: Colors.white, size: 15),
                          'Email - Pranavdaveofficial@gmail.com'),
                      SizedBox(height: 5),
                      data(Icon(Icons.phone, color: Colors.white, size: 15),
                          'Contact - +91 7016156637')
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                          onTap: () {
                            try {
                              launch(github);
                            } on Exception catch (e) {
                              print(e);
                            }
                          },
                          onHover: (val) {
                            setState(() {
                              isHovered[0] = val;
                            });
                          },
                          child: socialButtons('Github', isHovered[0])),
                      InkWell(
                          onTap: () {
                            try {
                              launch(linkedin);
                            } on Exception catch (e) {
                              print(e);
                            }
                          },
                          onHover: (val) {
                            setState(() {
                              isHovered[1] = val;
                            });
                          },
                          child: socialButtons('LinkedIn', isHovered[1])),
                      InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              isHovered[2] = value;
                            });
                          },
                          child: socialButtons('Instagram', isHovered[2])),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

Widget data(Icon icon, String text) {
  return Row(
    children: [
      icon,
      SizedBox(width: 8),
      Text(text,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, color: Colors.teal)),
    ],
  );
}

Widget socialButtons(String text, bool isHovered) {
  return Container(
    height: 15,
    width: 80,
    decoration: BoxDecoration(
        color: isHovered ? Colors.teal : null,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.cyan)),
    child: Center(
      child: Text(text,
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.0,
            fontSize: 8,
          )),
    ),
  );
}
