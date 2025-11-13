import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FitnessContent extends StatefulWidget {
  const FitnessContent({super.key});

  @override
  _FitnessContentState createState() => _FitnessContentState();
}

class _FitnessContentState extends State<FitnessContent> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fitness',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Keeping the 'Daily Activity' section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daily Activity',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildProgressRow(
                            'Steps', '11,000 / 16,000', 0.68, Colors.green),
                        SizedBox(height: 10),
                        _buildProgressRow(
                            'Calories', '440 / 680 Cal', 0.48, Colors.yellow),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Navigation bar for "At Home" and "Gym" with hover effect
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNavBarItem('At Home', 0),
                  _buildNavBarItem('Gym', 1),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Display content based on the selected index
            _buildContent(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Use the selected index for navigation
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.self_improvement), label: 'Meditation'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center), label: 'Fitness'),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant), label: 'Nutrition'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  // Function to create a progress row for daily activity
  Widget _buildProgressRow(String title, String value, double progress,
      Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 16, color: Colors.white)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(value, style: TextStyle(fontSize: 14, color: Colors.white)),
            SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                value: progress,
                color: color,
                backgroundColor: Colors.grey[800],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Function to create the hoverable navigation bar item
  Widget _buildNavBarItem(String label, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: _selectedIndex == index ? Colors.yellow : Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: _selectedIndex == index ? Colors.black : Colors.grey[700],
            ),
          ),
        ),
      ),
    );
  }

  // Function to display content based on selected navigation
  Widget _buildContent() {
    if (_selectedIndex == 0) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recommended for you',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16), // Space below the title
            GestureDetector(
              onTap: () async {
                const url = 'https://www.youtube.com/watch?v=cbKkB3POqaY';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    // Background image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/img/Push.png', // Replace with your asset
                        width: double.infinity,
                        height: 200, // Adjust height as needed
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Content overlay
                    Positioned(
                      bottom: 16,
                      left: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Full Body HIIT', // Main title
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  // Semi-transparent background
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.timer, size: 16,
                                        color: Colors.white),
                                    SizedBox(width: 4),
                                    Text(
                                      '28 mins',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  // Semi-transparent background
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.local_fire_department, size: 16,
                                        color: Colors.white),
                                    SizedBox(width: 4),
                                    Text(
                                      '375 Kcal',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),


            //Card1

            SizedBox(height: 16),
            Text(
              'Daily Workout',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 8),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      const url = 'https://www.youtube.com/watch?v=ImI63BUUPwU';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          // Background image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/img/FatBurning.jpg', // Replace with your asset
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.6, // 60% of the screen width
                              height: 200, // Fixed height as needed
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Content overlay
                          Positioned(
                            bottom: 16,
                            left: 16,
                            right: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cardio Workout', // Main title
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        // Semi-transparent background
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.timer, size: 16,
                                              color: Colors.white),
                                          SizedBox(width: 4),
                                          Text(
                                            '20 mins',
                                            style: TextStyle(fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        // Semi-transparent background
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.local_fire_department,
                                              size: 16, color: Colors.white),
                                          SizedBox(width: 4),
                                          Text(
                                            '290 Kcal',
                                            style: TextStyle(fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //Card2

                  SizedBox(width: 16), // Space between the two cards

                  // Second Card (Another Workout)
                  GestureDetector(
                    onTap: () async {
                      const url = 'https://www.youtube.com/watch?v=nfsQW1uGoBg';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          // Background image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/img/Back.png', // Replace with your asset
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.6, // 60% of the screen width
                              height: 200, // Fixed height as needed
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Content overlay
                          Positioned(
                            bottom: 16,
                            left: 16,
                            right: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Back Workout', // Change the title
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        // Semi-transparent background
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.timer, size: 16,
                                              color: Colors.white),
                                          SizedBox(width: 4),
                                          Text(
                                            '6 mins',
                                            style: TextStyle(fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        // Semi-transparent background
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.local_fire_department,
                                              size: 16, color: Colors.white),
                                          SizedBox(width: 4),
                                          Text(
                                            '60 Kcal',
                                            style: TextStyle(fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //Card3

                  SizedBox(width: 16), // Space between the two cards

                  // Third Card (Add your new card)
                  GestureDetector(
                    onTap: () async {
                      const url = 'https://www.youtube.com/watch?v=JGeRYIZdojU';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          // Background image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/img/Push2.png', // Replace with your asset
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.6, // 60% of the screen width
                              height: 200, // Fixed height as needed
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Content overlay
                          Positioned(
                            bottom: 16,
                            left: 16,
                            right: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'New Workout', // Change the title
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        // Semi-transparent background
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.timer, size: 16,
                                              color: Colors.white),
                                          SizedBox(width: 4),
                                          Text(
                                            '20 min',
                                            style: TextStyle(fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        // Semi-transparent background
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.local_fire_department,
                                              size: 16, color: Colors.white),
                                          SizedBox(width: 4),
                                          Text(
                                            '300 Kcal',
                                            style: TextStyle(fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),


            SizedBox(height: 16), // Space between the cards
            Text(
              'AI suggestion',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 16), // Space between the cards
            GestureDetector(
              onTap: () async {
                const url = 'https://www.youtube.com/watch?v=NJU8dcCacRY';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    // Background image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/img/stretch.png', // Replace with your asset
                        width: double.infinity,
                        height: 200, // Adjust height as needed
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Content overlay
                    Positioned(
                      bottom: 16,
                      left: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Yoga Session', // Main title
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  // Semi-transparent background
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.timer, size: 16,
                                        color: Colors.white),
                                    SizedBox(width: 4),
                                    Text(
                                      '30 mins',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  // Semi-transparent background
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.local_fire_department, size: 16,
                                        color: Colors.white),
                                    SizedBox(width: 4),
                                    Text(
                                      '150 Kcal',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    //Card1

    else if (_selectedIndex == 1) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recommended for you',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16), // Space below the title
            GestureDetector(
              onTap: () async {
                const url = 'https://www.youtube.com/watch?v=6Nh0zpbZv_Q';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    // Background image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/img/FullBody1.jpg', // Replace with your asset
                        width: double.infinity,
                        height: 200, // Adjust height as needed
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Content overlay
                    Positioned(
                      bottom: 16,
                      left: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fat Burning Workout', // Main title
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  // Semi-transparent background
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.timer, size: 16,
                                        color: Colors.white),
                                    SizedBox(width: 4),
                                    Text(
                                      '31 mins',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  // Semi-transparent background
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.local_fire_department, size: 16,
                                        color: Colors.white),
                                    SizedBox(width: 4),
                                    Text(
                                      '410 Kcal',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Card2
Padding(
   padding: const EdgeInsets.all(10.0),
   child: Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       Text(
         'Gym Workout',
         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
       ),
       SizedBox(height: 16), // Space below the title
       GestureDetector(
         onTap: () async {
           const url = 'https://www.youtube.com/watch?v=JGeRYIZdojU';
           if (await canLaunch(url)) {
             await launch(url);
           } else {
             throw 'Could not launch $url';
           }
           },
         child: Card(
           elevation: 4,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(12),
           ),
           child: Stack(
             children: [
                          // Background image
               ClipRRect(
                 borderRadius: BorderRadius.circular(12),
                 child: Image.asset(
                   'assets/img/LatPullDown.png', // Replace with your asset
                   width: double.infinity,
                   height: 200, // Adjust height as needed
                   fit: BoxFit.cover,
                 ),
               ),
                          // Content overlay
               Positioned(
                 bottom: 16,
                 left: 16,
                 right: 16,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       'Lat Pulldown Workout', // Main title
                       style: TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                         color: Colors.white,
                       ),
                     ),
                     SizedBox(height: 8),
                     Row(
                       children: [
                         Container(
                           padding: EdgeInsets.symmetric(
                               horizontal: 8, vertical: 4),
                           decoration: BoxDecoration(
                             color: Colors.white.withOpacity(0.2),
                             borderRadius: BorderRadius.circular(8),
                           ),
                           child: Row(
                             children: [
                               Icon(Icons.timer,
                                   size: 16, color: Colors.white),
                               SizedBox(width: 4),
                               Text(
                                 '10 mins',
                                 style: TextStyle(
                                     fontSize: 14,
                                     color: Colors.white),
                               ),
                             ],
                           ),
                         ),
                         SizedBox(width: 16),
                         Container(
                           padding: EdgeInsets.symmetric(
                               horizontal: 8, vertical: 4),
                           decoration: BoxDecoration(
                             color: Colors.white.withOpacity(0.2),
                             borderRadius: BorderRadius.circular(8),
                           ),
                           child: Row(
                             children: [
                               Icon(Icons.local_fire_department,
                                   size: 16, color: Colors.white),
                               SizedBox(width: 4),
                               Text(
                                 '375 Kcal',
                                 style: TextStyle(
                                     fontSize: 14,
                                     color: Colors.white),
                               ),
                             ],
                           ),
                         ),
                       ],
                     ),
                   ],
                 ),
               ),
             ],
           ),
         ),
       ),
      Padding(
         padding: const EdgeInsets.all(10.0),
         child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
             Text(
               'Learn More',
               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
             ),
             SizedBox(height: 16), // Space below the title
                GestureDetector(
                  onTap: () async {
                    const url = 'https://www.youtube.com/watch?v=a1CwygQ13VI';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                    },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                                // Background image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/img/playlist.jpg', // Replace with your asset
                            width: double.infinity,
                            height: 200, // Adjust height as needed
                            fit: BoxFit.cover,
                          ),
                        ),
                                // Content overlay
                        Positioned(
                          bottom: 16,
                          left: 16,
                          right: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Workout Playlist', // Main title
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.timer, size: 16,
                                            color: Colors.white),
                                        SizedBox(width: 4),
                                        Text(
                                          '18 mins',
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.local_fire_department, size: 16,
                                            color: Colors.white),
                                        SizedBox(width: 4),
                                        Text(
                                          'Relax',
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

         ],
         ),
      ),
                ],
              ),
            )
          ]),
      );

    } else {
      return Container(); // Return an empty container when condition isn't met
    }
  }
}


