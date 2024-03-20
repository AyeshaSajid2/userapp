import 'package:flutter/material.dart';
import 'package:usersapp/global/global.dart';
import 'package:usersapp/widgets/my_drawer.dart';
// import 'package:usersappels/menus.dart';

class HomeScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Color myColor = const Color(0xFF33536F);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 2) {
        // Open drawer for "Profile" tab using the GlobalKey
        _scaffoldKey.currentState?.openDrawer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        flexibleSpace: Container(
          // decoration: const BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: [Colors.cyan, Colors.amber],
          //     begin: FractionalOffset(0.0, 0.0),
          //     end: FractionalOffset(1.0, 0.0),
          //     stops: [0.0, 1.0],
          //     tileMode: TileMode.clamp,
          //   ),
          // ),
          color: const Color.fromARGB(255, 60, 116, 164),
        ),
        title: Text(
          sharedPreferences!.getString("name")!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: "lobster",
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.post_add,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => Container()),
                ),
              );
            },
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(0xd7, 0x57, 0x3c, 1.0),
        onTap: _onItemTapped,
      ),
    );
  }
}
