// // ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';

// class MyAppBar extends StatelessWidget with PreferredSizeWidget {
//   final PreferredSizeWidget? bottom;
//   MyAppBar({super.key, this.bottom});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       flexibleSpace: Container(
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(
//           colors: [
//             Colors.cyan,
//             Colors.amber,
//           ],
//           begin: FractionalOffset(0.0, 0.0),
//           end: FractionalOffset(1.0, 0.0),
//           stops: [0.0, 1.0],
//           tileMode: TileMode.clamp,
//         )),
//       ),
//       leading: IconButton(
//         icon: const Icon(Icons.arrow_back),
//         onPressed: () {
//           Navigator.pop(context);
//         },
//       ),
//       title: const Text(
//         "iFood",
//         style: TextStyle(fontSize: 45, fontFamily: "Signatra"),
//       ),
//       centerTitle: true,
//       automaticallyImplyLeading: true,
//       actions: [
//         Stack(
//           children: [
//             IconButton(
//               icon: const Icon(
//                 Icons.shopping_cart,
//                 color: Colors.cyan,
//               ),
//               onPressed: () {
//                 //send user to cart screen
//               },
//             ),
//             const Positioned(
//               child: Stack(
//                 children: [
//                   Icon(
//                     Icons.brightness_1,
//                     size: 20.0,
//                     color: Colors.green,
//                   ),
//                   Positioned(
//                     top: 3,
//                     right: 4,
//                     child: Center(
//                       child: Text(
//                         "0",
//                         style: TextStyle(color: Colors.white, fontSize: 12),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => bottom == null
//       ? Size(56, AppBar().preferredSize.height)
//       : Size(56, 80 + AppBar().preferredSize.height);
// }

import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;

  // ignore: prefer_const_constructors_in_immutables, use_super_parameters
  MyAppBar({Key? key, this.bottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const Text(
        "iFood",
        style: TextStyle(fontSize: 45, fontFamily: "Signatra"),
      ),
      centerTitle: true,
      automaticallyImplyLeading: true,
      bottom: bottom,
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.cyan,
              ),
              onPressed: () {
                //send user to cart screen
              },
            ),
            const Positioned(
              child: Stack(
                children: [
                  Icon(
                    Icons.brightness_1,
                    size: 20.0,
                    color: Colors.green,
                  ),
                  Positioned(
                    top: 3,
                    right: 4,
                    child: Center(
                      child: Text(
                        "0",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => bottom == null
      ? Size(56, AppBar().preferredSize.height)
      : Size(56, 80 + AppBar().preferredSize.height);
}
