// import 'dart:async';

// import 'package:flutter/material.dart';

// import 'package:sellersapp/authentication/auth_screen.dart';
// import 'package:sellersapp/global/global.dart';
// import 'package:sellersapp/home_screen/main_screen.dart';

// class MySplashScreen extends StatefulWidget {
//   const MySplashScreen({super.key});

//   @override
//   State<MySplashScreen> createState() => _MySplashScreenState();
// }

// class _MySplashScreenState extends State<MySplashScreen> {
//   startTimer() {
//     Timer(const Duration(seconds: 10), () async {
//       // if seller is already loggedin already
//       if (firebaseAuth.currentUser != null) {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (c) => const HomeScreen()));
//       }
//       // if seller is already not loggedin
//       else {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (c) => const AuthScreen()));
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Container(
//         color: Colors.white,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(6.0),
//                 child: Image.asset("images/splash.jpg"),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Padding(
//                 padding: EdgeInsets.all(
//                   18,
//                 ),
//                 child: Text(
//                   "Sell food online",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 30,
//                     fontFamily: "Signatra",
//                     letterSpacing: 3,
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:sellersapp/authentication/auth_screen.dart';

class MySplashScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _photoAnimationController;
  late Animation<double> _photoAnimation;

  @override
  void initState() {
    super.initState();

    // Photo animation (moving to the center)
    _photoAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _photoAnimation = Tween<double>(begin: 0, end: 1.22).animate(
      CurvedAnimation(
        parent: _photoAnimationController,
        curve: Curves.easeInOut,
      ),
    );
    _photoAnimationController.forward();
  }

  @override
  void dispose() {
    _photoAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF33536F), // Adjust as needed
      body: Stack(
        children: [
          Center(
            child: SlideTransition(
              position: _photoAnimation.drive(Tween<Offset>(
                begin: const Offset(0, 1), // Start from above
                end: const Offset(0, 0),
              )),
              child: Container(
                width: 350,
                height: 350,
                decoration: const BoxDecoration(
                  color: Color(0xFF33536F),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('images/spp.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'VarelaRound',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'foodflow',
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'VarelaRound',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(225, 255, 182, 23),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (c) => const AuthScreen()),
                    );
                  },
                  // ignore: sort_child_properties_last
                  child: const Text(
                    'Get Started',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
