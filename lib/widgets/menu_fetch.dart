// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:usersapp/models/menus.dart';
import 'package:usersapp/widgets/items_design.dart';

import '../models/items.dart';
import '../models/sellers.dart';
// import '../widgets/info_design.dart';
import 'menus_design.dart';
import 'my_drawer.dart';
import 'progress_bar.dart';
import 'sellers_design.dart';

class HomeScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.cyan,
                  Colors.amber,
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              )),
        ),
        title: const Text(
          "iFood",
          style: TextStyle(fontSize: 45, fontFamily: "Signatra"),
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              // ignore: sized_box_for_whitespace
              child: Container(
                height: MediaQuery.of(context).size.height * .3,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * .3,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    autoPlayAnimationDuration:
                    const Duration(milliseconds: 500),
                    autoPlayCurve: Curves.decelerate,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: items.map((index) {
                    return Builder(builder: (BuildContext context) {
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
            stream:
            FirebaseFirestore.instance.collection("menus").snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? SliverToBoxAdapter(
                child: Center(
                  child: circularProgress(),
                ),
              )
                  : SliverStaggeredGrid.countBuilder(
                crossAxisCount: 1,
                staggeredTileBuilder: (c) => const StaggeredTile.fit(1),
                itemBuilder: (context, index) {
                  Menus sModel = Menus.fromJson(
                      snapshot.data!.docs[index].data()!
                      as Map<String, dynamic>);
                  //design for display sellers-cafes-restuarents
                  return MenusDesignWidget(
                    model: sModel,
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
