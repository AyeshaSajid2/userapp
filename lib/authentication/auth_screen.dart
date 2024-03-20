import 'package:flutter/material.dart';

import 'login.dart';
import 'register.dart';

class AuthScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const AuthScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  Widget _buildTab(String text, int index) {
    return Container(
      width: 120.0, // Adjust the width as needed
      height: 50.0,
      decoration: BoxDecoration(
        color: _selectedIndex == index
            ? const Color.fromARGB(202, 14, 206, 46)
            : Colors.transparent,
        gradient: _selectedIndex == index
            ? const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF56B89F),
                  Color(0xFF39F3BB),
                  Color.fromRGBO(210, 217, 223, 1),
                  Color.fromRGBO(147, 187, 222, 1),
                  Colors.cyan,
                ],
              )
            : null,
      ),
      child: InkWell(
        onTap: () {
          _tabController.animateTo(index);
        },
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock,
                color: _selectedIndex == index ? Colors.white : Colors.black,
              ),
              const SizedBox(width: 8.0),
              Text(
                text,
                style: TextStyle(
                  color: _selectedIndex == index ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topRight,
            //   end: Alignment.bottomLeft,
            //   colors: [
            //     // Color(0xFF56B89F),
            //     // Color(0xFF39F3BB),
            //     // Colors.cyan,
            //     Color(0xFF574BCD),
            //     Color(0xFF2999AD),
            //     Color(0xFF41E975),
            //   ],
            // ),
            color: Color.fromARGB(255, 60, 116, 164),
          ),
        ),
        automaticallyImplyLeading: false,
        title: const Text(
          "FoodFlow",
          style: TextStyle(
            fontSize: 50,
            color: Colors.white,
            fontFamily: "Signatra",
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: TabBar(
            controller: _tabController,
            tabs: [
              _buildTab("Login", 0),
              _buildTab("Register", 1),
            ],
            indicatorColor: Colors.black,
            indicatorWeight: 6,
            labelColor: Colors.transparent,
            unselectedLabelColor: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(210, 217, 223, 1),
              Color.fromRGBO(147, 187, 222, 1),
            ],
          ),
        ),
        child: TabBarView(
          controller: _tabController,
          children: const [
            LoginScreen(),
            RegisterScreen(),
          ],
        ),
      ),
    );
  }
}
