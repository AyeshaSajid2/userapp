// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:usersapp/assistantMethods/assistant_methods.dart';
import 'package:usersapp/models/menus.dart';
import 'package:usersapp/widgets/menus_design.dart';

import '../models/sellers.dart';
// import '../widgets/info_design.dart';
import '../widgets/menu_fetch.dart';
import '../widgets/my-drawer.dart';
import '../widgets/progress_bar.dart';
import '../widgets/sellers_design.dart';

class MenuFetch extends StatefulWidget {
  const MenuFetch({Key? key}) : super(key: key);

  @override
  _MenuFetchState createState() => _MenuFetchState();
}



class _MenuFetchState extends State<MenuFetch>
{
  final items = [
    "images/slider/0.jpg",
    "images/slider/1.jpg",
    "images/slider/2.jpg",
    "images/slider/3.jpg",
    "images/slider/4.jpg",
    "images/slider/5.jpg",
    "images/slider/6.jpg",
    "images/slider/7.jpg",
    "images/slider/8.jpg",
    "images/slider/9.jpg",
    "images/slider/10.jpg",
    "images/slider/11.jpg",
    "images/slider/12.jpg",
    "images/slider/13.jpg",
    "images/slider/14.jpg",
    "images/slider/15.jpg",
    "images/slider/16.jpg",
    "images/slider/17.jpg",
    "images/slider/18.jpg",
    "images/slider/19.jpg",
    "images/slider/20.jpg",
    "images/slider/21.jpg",
    "images/slider/22.jpg",
    "images/slider/23.jpg",
    "images/slider/24.jpg",
    "images/slider/25.jpg",
    "images/slider/26.jpg",
    "images/slider/27.jpg",
  ];

  @override
  void initState() {
    super.initState();

    clearCartNow(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
            color: Color.fromARGB(255, 60, 116, 164),
        ),
        title: const Text(
          "iFood",
          style: TextStyle(fontSize: 45, fontFamily: "Signatra"),
        ),
        centerTitle: true,
        // actions: [
        //   ElevatedButton(onPressed:
        //   Navigator.push(context, MaterialPageRoute(builder: (c) => HomeScreen())),
        //       child: Text("Menus"));
        // ],
      ),
      drawer: MyDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: MediaQuery.of(context).size.height * .3,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * .3,
                    aspectRatio: 16/9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    autoPlayAnimationDuration: const Duration(milliseconds: 500),
                    autoPlayCurve: Curves.decelerate,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: items.map((index) {
                    return Builder(builder: (BuildContext context){
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 1.0),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset(
                            index,
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    });
                  }).toList(),
                ),
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("menus")
                .snapshots(),
            builder: (context, snapshot)
            {
              return !snapshot.hasData
                  ? SliverToBoxAdapter(child: Center(child: circularProgress(),),)
                  : SliverStaggeredGrid.countBuilder(
                crossAxisCount: 1,
                staggeredTileBuilder: (c) => StaggeredTile.fit(1),
                itemBuilder: (context, index)
                {
                  Menus mModel = Menus.fromJson(
                      snapshot.data!.docs[index].data()! as Map<String, dynamic>
                  );
                  //design for display sellers-cafes-restuarents
                  return MenusDesignWidget(
                    model: mModel,
                    context: context,
                  );
                },
                itemCount: snapshot.data!.docs.length,
              );
            },
          ),
        ],
      ),
    );
  }
}
