import 'package:flutter/material.dart';


class CookNowScreen extends StatelessWidget {
  final String title;
  final String carbs;
  final String calories;
  final String proteins;
  final String fats;
  final List<String> ingredients;
  final List<String> instructions;


  const CookNowScreen({super.key, 
    required this.title,
    required this.carbs,
    required this.calories,
    required this.proteins,
    required this.fats,
    required this.ingredients,
    required this.instructions,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),


              // Nutrition Info Row
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _nutritionInfo(carbs, Icons.grain),
                  _nutritionInfo(calories, Icons.whatshot),
                  _nutritionInfo(proteins, Icons.local_fire_department),
                  _nutritionInfo(fats, Icons.bolt),
                ],
              ),
              SizedBox(height: 20),


              // Ingredients Section
              Text(
                'Ingredients',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              for (String ingredient in ingredients)
                Text('• $ingredient', style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),


              // Instructions Section
              Text(
                'Instructions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              for (int i = 0; i < instructions.length; i++)
                Text(
                  '${i + 1}. ${instructions[i]}',
                  style: TextStyle(fontSize: 16),
                ),
              SizedBox(height: 20),


              // Done Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.black,
                  ),
                  child: Text(
                    "Done",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nutritionInfo(String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.black, size: 30),
        SizedBox(height: 8),
        Text(value, style: TextStyle(fontSize: 16, color: Colors.black)),
      ],
    );
  }
}
