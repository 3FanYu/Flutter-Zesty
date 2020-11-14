import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zesty/tab_home/page_home.dart';
import 'package:zesty/tab_order/page_order.dart';
import 'package:zesty/tab_profile/page_profile.dart';
import 'package:zesty/tab_search/page_search.dart';
import 'package:zesty/tab_wish/page_wish.dart';


class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PageController _pageController = PageController();
  List<Widget> _screens = [
    HomePage(),
    SearchPage(),
    OrderPage(),
    WishPage(),
    ProfilePage(),
  ];
  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Hexcolor('#4C5F6D'),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? Colors.white : Colors.grey,
            ),
            title: Text(
              'home',
              style: TextStyle(
                color: _selectedIndex == 0 ? Colors.white : Colors.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _selectedIndex == 1 ? Colors.white : Colors.grey,
            ),
            title: Text(
              'search',
              style: TextStyle(
                color: _selectedIndex == 1 ? Colors.white : Colors.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.assignment,
              color: _selectedIndex == 2 ? Colors.white : Colors.grey,
            ),
            title: Text(
              'order',
              style: TextStyle(
                color: _selectedIndex == 2 ? Colors.white : Colors.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              color: _selectedIndex == 3 ? Colors.white : Colors.grey,
            ),
            title: Text(
              'wish',
              style: TextStyle(
                color: _selectedIndex == 3 ? Colors.white : Colors.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _selectedIndex == 4 ? Colors.white : Colors.grey,
            ),
            title: Text(
              'profile',
              style: TextStyle(
                color: _selectedIndex == 4 ? Colors.white : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
