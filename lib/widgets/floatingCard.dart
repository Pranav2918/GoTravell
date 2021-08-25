import 'package:flutter/material.dart';

Widget floatingCard(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Card(
    child: Container(
      height: screenSize.height / 10,
      width: screenSize.width / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          floatingCardData('Destinations'),
          divider(),
          floatingCardData('Dates'),
          divider(),
          floatingCardData('People'),
          divider(),
          floatingCardData('Experience')
        ],
      ),
    ),
  );
}

class SmallFloatingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        smallFloatingCard('Destinations'),
        smallFloatingCard('Dates'),
        smallFloatingCard('People'),
        smallFloatingCard('Experience')
      ],
    );
  }
}

//Widgets Related to Floating Card
Widget floatingCardData(String data) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      data,
      style: TextStyle(fontSize: 12),
    ),
  );
}

Widget divider() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: VerticalDivider(),
  );
}

Widget smallFloatingCard(String text) {
  return Container(
    margin: EdgeInsets.only(left: 25, right: 25),
    height: 40,
    width: double.infinity,
    child: Card(
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
        ),
      ),
    ),
  );
}
