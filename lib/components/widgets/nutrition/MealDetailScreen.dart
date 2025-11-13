
import 'package:flutter/material.dart';
import 'CookNowScreen.dart';
import 'meal_ingredients.dart';


class MealDetailScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final String time;
  final String carbs;
  final String calories;
  final String proteins;
  final String fats;


  const MealDetailScreen({super.key, 
    required this.title,
    required this.description,
    required this.imagePath,
    required this.time,
    required this.carbs,
    required this.calories,
    required this.proteins,
    required this.fats,
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
              // Meal Image
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imagePath,
                    height: 160,
                    width: 160,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),


              // Meal Title and Time
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 8),
                  Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        time,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),


              // Meal Description
              Text(
                description,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              SizedBox(height: 20),


              // Nutrition Info Section
              Text(
                "Nutrition Info",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _nutritionInfo('Carbs', carbs, Icons.grain),
                  _nutritionInfo('Proteins', proteins, Icons.local_fire_department),
                  _nutritionInfo('Calories', calories, Icons.whatshot),
                  _nutritionInfo('Fats', fats, Icons.bolt),
                ],
              ),
              SizedBox(height: 30),


              // Cook Now Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          final selectedMeal = mealIngredients[title]; // Fetch data based on the meal title
                          if (selectedMeal != null) {
                            return CookNowScreen(
                              title: title,
                              carbs: carbs,
                              calories: calories,
                              proteins: proteins,
                              fats: fats,
                              ingredients: selectedMeal['ingredients']!,
                              instructions: selectedMeal['instructions']!,
                            );
                          } else {
                            return Scaffold(
                              appBar: AppBar(
                                title: Text('Error'),
                              ),
                              body: Center(
                                child: Text('No data available for this meal.'),
                              ),
                            );
                          }
                        },
                      ),
                    );


                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    backgroundColor: Colors.black,
                  ),
                  child: Text(
                    "Cook Now",
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


  Widget _nutritionInfo(String label, String value, IconData icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.amber[600], size: 30),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 12, color: Colors.grey[700]),
        ),
      ],
    );
  }
}
