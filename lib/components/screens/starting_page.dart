import 'package:flutter/material.dart';
import 'package:resunate_final_project/components/screens/login_page.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/splash/resonate_bg.png"),
                    fit: BoxFit.cover,
                  )),
            )),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffdbe64c),
                  ),
                  onPressed: () => Navigator.of(context).push(_createRoute()),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ))),
        )
      ],
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        // Slow down the animation by adjusting the CurvedAnimation
        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        // Adjust the animation speed
        var slowAnimation = CurvedAnimation(
          parent: animation,
          curve: const Interval(0.0, 1.0, curve: curve),
        );

        return SlideTransition(
          position: slowAnimation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 1500), // Slow down here
    );
  }
}
