import 'package:cannabis/DrawerPages/Accessories.dart';
import 'package:cannabis/DrawerPages/Edibles.dart';
import 'package:cannabis/DrawerPages/Explore.dart';
import 'package:cannabis/DrawerPages/Extracts.dart';
import 'package:cannabis/DrawerPages/Flowers.dart';
import 'package:cannabis/DrawerPages/Vapes.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../Components/Search.dart';

class HomeIndex extends StatefulWidget {
  final token;
  const HomeIndex({@required this.token, Key? key}) : super(key: key);

  @override
  State<HomeIndex> createState() => _HomeIndexState();
}

class _HomeIndexState extends State<HomeIndex> {

  //
  late String email;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);

    email = jwtDecodedToken['email'];
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Explore(),
    VapesPage(),
    Extractspage(),
    EdiblesPages(),
    FlowersPage(),
    AccessoriesPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (context) {
              return IconButton(
                  onPressed: () => {Scaffold.of(context).openDrawer()},
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ));
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                children: [
                  const Image(
                    image: AssetImage('lib/assets/logo1.png'),
                    color: Color(0xff81AA66),
                  ),
                  const Image(
                    image: AssetImage('lib/assets/logo2.png'),
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  const Search(),
                  IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.black),
                    onPressed: () {},
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage('lib/assets/faceavt.jpg'),
                  ),
                ],
              ),
            )
          ],
        ),
        body: Center(
          child: _widgetOptions[_selectedIndex],
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: ListView(
              children: [
                const Image(
                  image: AssetImage('lib/assets/logoHomeIndex.png'),
                  width: 100,
                  height: 100,
                ),
                const SizedBox(
                    width: 100,
                    height: 100,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('lib/assets/faceavt.jpg'),
                      radius: 35,
                    )),
                const Center(
                  child: Text('dukauwa.du@gmail.com'),
                ),
                ListTile(
                  selectedColor: const Color(0xff81AA66),
                  textColor: Colors.grey,
                  title: const Text(
                    'Explore',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  selected: _selectedIndex == 0,
                  onTap: () {
                    // Update the state of the app
                    _onItemTapped(0);
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  selectedColor: const Color(0xff81AA66),
                  textColor: Colors.grey,
                  title: const Text(
                    'Vapes',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  selected: _selectedIndex == 1,
                  onTap: () {
                    // Update the state of the app
                    _onItemTapped(1);
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  selectedColor: const Color(0xff81AA66),
                  textColor: Colors.grey,
                  title: const Text(
                    'Extracts',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  selected: _selectedIndex == 2,
                  onTap: () {
                    // Update the state of the app
                    _onItemTapped(2);
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  selectedColor: const Color(0xff81AA66),
                  textColor: Colors.grey,
                  title: const Text(
                    'Edibles',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  selected: _selectedIndex == 3,
                  onTap: () {
                    // Update the state of the app
                    _onItemTapped(3);
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  selectedColor: const Color(0xff81AA66),
                  textColor: Colors.grey,
                  title: const Text(
                    'Flowers',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  selected: _selectedIndex == 4,
                  onTap: () {
                    // Update the state of the app
                    _onItemTapped(4);
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  selectedColor: const Color(0xff81AA66),
                  textColor: Colors.grey,
                  title: const Text(
                    'Accessories',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  selected: _selectedIndex == 5,
                  onTap: () {
                    // Update the state of the app
                    _onItemTapped(5);
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 90,
                ),
                ListTile(
                  title: const Text(
                    'Log out',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  selected: _selectedIndex == 6,
                  onTap: () {
                    // Update the state of the app
                    _onItemTapped(6);
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
