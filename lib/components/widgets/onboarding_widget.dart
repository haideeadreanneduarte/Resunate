import 'package:flutter/material.dart';

class OnboardingCard extends StatefulWidget {
   final Function(String, List<String>) onPressed;
  const OnboardingCard({super.key, required this.onPressed});

  @override
  State<OnboardingCard> createState() => _OnboardingCardState();
}

class _OnboardingCardState extends State<OnboardingCard> {

  Map<String, bool> selectedGoals = {
  'Relaxation': false,
  'Stress Relief': false,
  'Focus': false,
  'Mindfulness': false,
  'Sleep Improvement': false,
  'Emotional Balance': false,
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(child: ClipOval(child: Image.asset('assets/onboarding/1.png', height: 150, width: 150,))),
              ),
              const Center(
                child: Text(
                  "What types of meditation do you want?",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: selectedGoals.keys.map((goal) {
                    bool isSelected = selectedGoals[goal]!;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGoals[goal] = !isSelected;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xffdbe64c) : Colors.white,
                          border: Border.all(
                            color: isSelected ? Colors.black : Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              goal,
                              style: TextStyle(
                                fontSize: 16,
                                color: isSelected ? Colors.black : Colors.grey,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                            if (isSelected)
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.black,
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    String category = 'meditation';
                    List<String> preferences = selectedGoals.entries.where((entry) => entry.value).map((entry) => entry.key).toList();
                    widget.onPressed(category, preferences);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingCard2 extends StatefulWidget {
  final Function(String, List<String>) onPressed;
  const OnboardingCard2({super.key, required this.onPressed});

  @override
  State<OnboardingCard2> createState() => _OnboardingCard2State();
}

class _OnboardingCard2State extends State<OnboardingCard2> {
  Map<String, bool> selectedGoals = {
  'Strength': false,
  'Endurance': false,
  'Flexibility': false,
  'Muscle Gain': false,
  'Weight Loss': false,
  'Cardio Health': false,
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(child: ClipOval(child: Image.asset('assets/onboarding/2.png', height: 150, width: 150,))),
              ),
              const Center(
                child: Text(
                  "What are your fitness goals?",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: selectedGoals.keys.map((goal) {
                    bool isSelected = selectedGoals[goal]!;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGoals[goal] = !isSelected;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xffdbe64c) : Colors.white,
                          border: Border.all(
                            color: isSelected ? Colors.black : Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              goal,
                              style: TextStyle(
                                fontSize: 16,
                                color: isSelected ? Colors.black : Colors.grey,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                            if (isSelected)
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.black,
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    String category = 'fitness';
                    List<String> preferences = selectedGoals.entries.where((entry) => entry.value).map((entry) => entry.key).toList();
                    widget.onPressed(category, preferences);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingCard3 extends StatefulWidget {
  final Function(String, List<String>) onPressed;
  const OnboardingCard3({super.key, required this.onPressed});

  @override
  State<OnboardingCard3> createState() => _OnboardingCard3State();
}

class _OnboardingCard3State extends State<OnboardingCard3> {
   Map<String, bool> selectedGoals = {
  'Low Carb': false,
  'High Protein': false,
  'Hydration': false,
  'Meal Timing': false,
  'Mindful Eating': false,
  'Vitamins and Minerals': false,
  'Plant-Based Diet': false,
};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(child: ClipOval(child: Image.asset('assets/onboarding/3.png',height: 150, width: 150,))),
              ),
              const Center(
                child: Text(
                  "What are you aiming for with food?",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: selectedGoals.keys.map((goal) {
                    bool isSelected = selectedGoals[goal]!;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGoals[goal] = !isSelected;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xffdbe64c) : Colors.white,
                          border: Border.all(
                            color: isSelected ? Colors.black : Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              goal,
                              style: TextStyle(
                                fontSize: 16,
                                color: isSelected ? Colors.black : Colors.grey,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                            if (isSelected)
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.black,
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    String category = 'nutrition';
                    List<String> preferences = selectedGoals.entries.where((entry) => entry.value).map((entry) => entry.key).toList();
                    widget.onPressed(category, preferences);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

