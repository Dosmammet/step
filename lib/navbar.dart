import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:step3/screens/home_screen.dart';

import 'constant.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _pageIndex = 0;
  final List<Widget> _tabList = [
    HomeScreen(),
    Text('Home page'),
    Text('Home page'),
    Text('Home page'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _tabList.elementAt(_pageIndex),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment(0.0, 1.0),
              child: Container(
                height: 76,
                width: 343,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(1000),
                  ),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.grey,
                    showSelectedLabels: true,
                    showUnselectedLabels: true,
                    backgroundColor: Config().darkAppColor,
                    currentIndex: _pageIndex,
                    onTap: (int index) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(
                          FeatherIcons.home,
                        ),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          FeatherIcons.search,
                        ),
                        label: 'Logbook',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          FeatherIcons.activity,
                        ),
                        label: 'Inspection',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          FeatherIcons.activity,
                        ),
                        label: 'More',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
