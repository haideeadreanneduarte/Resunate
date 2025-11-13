import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resunate_final_project/components/widgets/bottom_navigator_widget.dart';
import 'package:resunate_final_project/components/widgets/onboarding_widget.dart';
import 'package:resunate_final_project/components/widgets/user_profile_widget.dart';
import 'package:resunate_final_project/services/models/user_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  static final PageController _pageController = PageController(initialPage: 0);
  final UserController _userController = UserController();
  final Map<String, List<String>> _preferences = {};

  void _updatePreferences(String category, List<String> newPreferences) {
    setState(() {
      _preferences[category] = newPreferences;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> onBoardingPages = [
      UserProfileWidget(onSubmit: (userData) async {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await _userController.addUser(user.uid, userData);
           ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );
          _pageController.nextPage(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        }
        else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('There was an error updating your profile')),
          );
        }
      }
      ),
      OnboardingCard(onPressed: (category, preferences) async{ 
        User? user = FirebaseAuth.instance.currentUser;
        _updatePreferences(category, preferences);
        if (user != null) {
          await  _userController.updateUserPreferences(user.uid, _preferences);
          _pageController.nextPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
        }
      }),
      
      OnboardingCard2(onPressed: (category, preferences) async{
       User? user = FirebaseAuth.instance.currentUser;
        _updatePreferences(category, preferences);
        if (user != null) {
          await  _userController.updateUserPreferences(user.uid, _preferences);
          _pageController.nextPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
        }
      }),
      
      OnboardingCard3(onPressed: (category, preferences) async {
        User? user = FirebaseAuth.instance.currentUser;
        _updatePreferences(category, preferences);
        if (user != null) {
          await  _userController.updateUserPreferences(user.uid, _preferences);
          await _userController.setOnboardingComplete(user.uid);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const BottomNavigatorWidget()),
          );
        }
      }),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.topCenter,
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: onBoardingPages.length,
                  effect: CustomizableEffect(
                    dotDecoration: DotDecoration(
                      width: 10,
                      height: 12,
                      color: Colors.grey,
                      verticalOffset: 0,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    spacing: 6.0,
                    activeDotDecoration: DotDecoration(
                      width: 64,
                      height: 12,
                      color: const Color(0xffdbe64c),
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              bottom: 0,
              child: Align(
                alignment: Alignment.center,
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: onBoardingPages,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
