import 'package:flutter/material.dart';

class CircularBottomNavigation extends StatefulWidget {
  @override
  _CircularBottomNavigationState createState() =>
      _CircularBottomNavigationState();
}

class _CircularBottomNavigationState extends State<CircularBottomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circular Bottom Navigation Example'),
      ),
      body: Center(
        child: Text('Selected Index: $_selectedIndex'),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.people),
                onPressed: () {
                  _onItemTapped(0);
                },
              ),
              IconButton(
                icon: Icon(Icons.restaurant_menu),
                onPressed: () {
                  _onItemTapped(1);
                },
              ),
              IconButton(
                icon: Icon(Icons.fastfood),
                onPressed: () {
                  _onItemTapped(2);
                },
              ),
              IconButton(
                icon: Icon(Icons.shopping_bag),
                onPressed: () {
                  _onItemTapped(3);
                },
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  _onItemTapped(4);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}