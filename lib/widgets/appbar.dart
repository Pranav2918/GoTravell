import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webdesign/services/auth.dart';

class NavBar extends StatefulWidget {
  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  List isHovering = [false, false, false, false];

  User? user;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
        color: Colors.black,
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(children: [
              Text('Travello',
                  style: TextStyle(color: Colors.white, fontSize: 28)),
              // Text(user!.displayName.toString()),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      onHover: (value) {
                        setState(() {
                          isHovering[0] = value;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Discover',
                            style: TextStyle(
                                fontSize: 18,
                                color: isHovering[0]
                                    ? Colors.redAccent
                                    : Colors.white),
                          ),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: isHovering[0],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width / 20,
                    ),
                    InkWell(
                      onTap: () {},
                      onHover: (value) {
                        setState(() {
                          isHovering[1] = value;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Profile',
                            style: TextStyle(
                                fontSize: 18,
                                color: isHovering[1]
                                    ? Colors.redAccent
                                    : Colors.white),
                          ),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: isHovering[1],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  AuthService().signOut();
                },
                onHover: (value) {
                  setState(() {
                    isHovering[2] = value;
                  });
                },
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                      letterSpacing: 1.0,
                      color: isHovering[2]
                          ? Colors.redAccent.withOpacity(0.7)
                          : Colors.white),
                ),
              ),
            ])));
  }
}

class NavTab extends StatefulWidget {
  @override
  _NavTabState createState() => _NavTabState();
}

class _NavTabState extends State<NavTab> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Travello',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            InkWell(
              onTap: () {
                AuthService().signOut();
              },
              onHover: (value) {
                setState(() {
                  isHovering = value;
                });
              },
              child: Text(
                'Sign Out',
                style: TextStyle(
                    letterSpacing: 1.0,
                    color: isHovering
                        ? Colors.redAccent.withOpacity(0.7)
                        : Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: AuthService().signOut,
                icon: Icon(Icons.logout, color: Colors.white)),
          )
        ],
        backgroundColor: Colors.black,
        title: Text(
          'Travello',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
