import 'package:flutter/material.dart';
import 'package:resunate_final_project/components/screens/home_page.dart';
import 'package:resunate_final_project/components/widgets/fitness/FitnessMain.dart';
import 'package:resunate_final_project/components/widgets/meditation/MeditationMain.dart';
import 'package:resunate_final_project/components/widgets/nutrition/NutritionMain.dart';
import 'package:resunate_final_project/components/screens/personal_page.dart';

class BottomNavigatorWidget extends StatefulWidget {
  const BottomNavigatorWidget({super.key});

  @override
  State<BottomNavigatorWidget> createState() => _BottomNavigatorWidgetState();
}

class _BottomNavigatorWidgetState extends State<BottomNavigatorWidget> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
     HomePage(),
     NutritionPage(),
     FitnessContent(),
     NavScreen(),
     PersonalPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black, // Primary color
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant),
          label: 'Nutrition',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center),
          label: 'Fitness',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.self_improvement),
          label: 'Meditation',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Personal',
        ),
      ],
    ),
    );
  }
}
