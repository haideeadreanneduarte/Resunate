import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'meditation.dart';


class NavScreen extends StatelessWidget {
 const NavScreen({super.key});


 @override
 Widget build(BuildContext context) {
   return PersistentTabView(
     tabs: [
       PersistentTabConfig(
         screen: const SizedBox(),
         item: ItemConfig(
           icon: Icon(
             Icons.home,
           ),
           title: "Home",
           activeForegroundColor: Colors.black,
         ),
       ),
       PersistentTabConfig(
         screen: MeditationScreen(),
         item: ItemConfig(
           icon: Icon(Icons.sports_gymnastics),
           title: "Meditation",
           activeForegroundColor: Colors.black,
         ),
       ),
       PersistentTabConfig(
         screen: const SizedBox(),
         item: ItemConfig(
           icon: Icon(Icons.fitness_center),
           title: "Fitness",
           activeForegroundColor: Colors.black,
         ),
       ),
       PersistentTabConfig(
         screen: const SizedBox(),
         item: ItemConfig(
           icon: Icon(Icons.apple),
           title: "Nutrition",
           activeForegroundColor: Colors.black,
         ),
       ),
       PersistentTabConfig(
         screen: const SizedBox(),
         item: ItemConfig(
           icon: Icon(Icons.person),
           title: "Profile",
           activeForegroundColor: Colors.black,
         ),
       ),
     ],
     navBarBuilder: (navBarConfig) => Style6BottomNavBar(
       navBarConfig: navBarConfig,
       navBarDecoration: NavBarDecoration(
         boxShadow: [
           BoxShadow(
             color: Colors.black.withOpacity(0.1),
             blurRadius: 8.0,
             spreadRadius: 2.0,
             offset: const Offset(0, -2),
           ),
         ],
       ),
     ),
   );
 }
}


