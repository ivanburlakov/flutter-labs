import 'package:flutter/material.dart';
import 'Discover.dart';
import 'Snapshot.dart';
import 'Search.dart';
import 'Collections.dart';
import 'placeholder_widget.dart';
import 'package:provider/provider.dart';
import 'theme.dart';

class Home extends StatefulWidget {
  Home({Key key = const Key("Home"), this.title = "Home"}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _currentIndex = 0;
  final _children = [
    Discover(),
    Snapshot(),
    Search(),
    Collections(),
    PlaceholderWidget(Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.nightlight_round,
              size: 32,
            ),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).swapTheme();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.account_circle,
              size: 32,
            ),
            onPressed: () {},
          ),
        ],
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: const Color(0xFF206BE4),
              ),
            ),
            ListTile(
              title: Text('Discover'),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Snapshot'),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Search'),
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Collections'),
              onTap: () {
                setState(() {
                  _currentIndex = 3;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('More'),
              onTap: () {
                setState(() {
                  _currentIndex = 4;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.recommend),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.featured_play_list_outlined),
            label: 'Snapshot',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmarks_outlined), label: 'Collections'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
        selectedItemColor: const Color(0xFF206BE4),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
