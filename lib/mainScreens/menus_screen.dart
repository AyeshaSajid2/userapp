import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:usersapp/assistantMethods/assistant_methods.dart';
import 'package:usersapp/global/global.dart';
import 'package:usersapp/models/menus.dart';
import 'package:usersapp/models/sellers.dart';
import 'package:usersapp/splashScreen/splash_screen.dart';
import 'package:usersapp/widgets/menus_design.dart';
import 'package:usersapp/widgets/sellers_design.dart';
import 'package:usersapp/widgets/my-drawer.dart';
import 'package:usersapp/widgets/progress_bar.dart';
import 'package:usersapp/widgets/text_widget_header.dart';


class MenusScreen extends StatefulWidget
{
  final Sellers? model;
  MenusScreen({this.model});

  @override
  _MenusScreenState createState() => _MenusScreenState();
}



class _MenusScreenState extends State<MenusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
            color: Color.fromARGB(255, 60, 116, 164),
        ),

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: ()
          {
            clearCartNow(context);

            Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen()));
          },
        ),
        title: const Text(
          "iFood",
          style: TextStyle(fontSize: 45, fontFamily: "Signatra"),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(pinned: true, delegate: TextWidgetHeader(title: widget.model!.sellerName.toString() + " Menus")),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("sellers")
                .doc(widget.model!.sellerUID)
                .collection("menus")
                .orderBy("publishedDate", descending: true)
                .snapshots(),
            builder: (context, snapshot)
            {
              return !snapshot.hasData
                  ? SliverToBoxAdapter(
                child: Center(child: circularProgress(),),
              )
                  : SliverStaggeredGrid.countBuilder(
                crossAxisCount: 1,
                staggeredTileBuilder: (c) => StaggeredTile.fit(1),
                itemBuilder: (context, index)
                {
                  Menus model = Menus.fromJson(
                    snapshot.data!.docs[index].data()! as Map<String, dynamic>,
                  );
                  return MenusDesignWidget(
                    model: model,
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
