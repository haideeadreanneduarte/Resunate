import 'package:flutter/material.dart';
import 'meditation_details.dart';
import 'music_details.dart';
import 'post_workout_details.dart';
import 'breathing_details.dart';
import 'custom_badge.dart';


class MeditationScreen extends StatelessWidget {
 const MeditationScreen({super.key});


 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: Padding(
       padding: const EdgeInsets.only(left: 24.0),
       child: ListView( // Changed to ListView for proper scrolling
         children: [
           SizedBox(
             height: AppBar().preferredSize.height,
           ),
           const Text(
             'Recommended for You',
             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
           ),
           const SizedBox(height: 12),
           Padding(
             padding: const EdgeInsets.only(right: 24.0),
             child: Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(12),
                 color: Colors.black,
                 image: const DecorationImage(
                   image: AssetImage('assets/images/img7.png'),
                   fit: BoxFit.cover,
                 ),
               ),
               height: 125,
               child: const Padding(
                 padding: EdgeInsets.all(12.0),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.end,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       'Healing',
                       style: TextStyle(
                           fontWeight: FontWeight.bold,
                           color: Colors.white,
                           fontSize: 20),
                     ),
                     Row(
                       children: [
                         CustomBadge(
                           icon: Icons.access_time_filled,
                           text: "25 min",
                           isContainer: true,
                         ),
                         SizedBox(width: 3),
                         CustomBadge(
                           icon: Icons.local_fire_department,
                           text: "432 Kcal",
                           isContainer: true,
                         ),
                       ],
                     ),
                   ],
                 ),
               ),
             ),
           ),
           const SizedBox(height: 12),
           _buildCategorySection(
             context,
             title: 'Meditation Sessions',
             cardDetails: [
               {'title': 'Positive Energy', 'image': 'meditation1.png', 'duration': '5 mins'},
               {'title': 'Self Love', 'image': 'meditation2.png', 'duration': '12 mins'},
               {'title': 'Stress & Anxiety', 'image': 'meditation3.png', 'duration': '15 mins'},
               {'title': 'Healing', 'image': 'meditation4.png', 'duration': '11 mins'},
               {'title': 'Abundance', 'image': 'meditation5.png', 'duration': '10 mins'},
             ],
             onTap: (title, image) => Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (context) => MeditationDetails(title: title, backgroundImage: image),
               ),
             ),
           ),
           const SizedBox(height: 12),
           _buildCategorySection(
             context,
             title: 'Breathing Exercise',
             cardDetails: [
               {'title': 'Calm', 'image': 'breathe1.png', 'duration': '1 min'},
               {'title': 'Anxiety-Relief', 'image': 'breathe2.png', 'duration': '1 min'},
               {'title': 'Box Breathing', 'image': 'breathe3.png', 'duration': '1 min'},
               {'title': 'Progressive Relaxation', 'image': 'breathe4.png', 'duration': '1 min'},
               {'title': 'Guided Visualization', 'image': 'breathe5.png', 'duration': '1 min'},
             ],
             onTap: (title, image) => Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (context) => BreathingDetails(title: title, backgroundImage: image),
               ),
             ),
           ),
           const SizedBox(height: 12),
           _buildCategorySection(
             context,
             title: 'Post Workout',
             cardDetails: [
               {'title': 'Recovery', 'image': 'workout1.png', 'duration': '6 mins'},
               {'title': 'Flexibility', 'image': 'workout2.png', 'duration': '16 mins'},
               {'title': 'Relaxation', 'image': 'workout3.png', 'duration': '14 mins'},
               {'title': 'Mobility', 'image': 'workout4.png', 'duration': '20 mins'},
               {'title': 'Cool Down', 'image': 'workout5.png', 'duration': '20 mins'},
             ],
             onTap: (title, image) => Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (context) => PostWorkoutDetails(title: title, backgroundImage: image),
               ),
             ),
           ),
           const SizedBox(height: 12),
           _buildCategorySection(
             context,
             title: 'Music',
             cardDetails: [
               {'title': 'Calm', 'image': 'music1.png', 'duration': '2 mins'},
               {'title': 'Waves', 'image': 'music2.png', 'duration': '2 mins'},
               {'title': 'Classical', 'image': 'music3.png', 'duration': '2 mins'},
               {'title': 'Forest', 'image': 'music4.png', 'duration': '2 mins'},
               {'title': 'Purity', 'image': 'music5.png', 'duration': '2 mins'},
             ],
             onTap: (title, image) => Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (context) => MusicDetails(title: title, backgroundImage: image),
               ),
             ),
           ),
           const SizedBox(height: 60),
         ],
       ),
     ),
   );
 }


 Widget _buildCategorySection(
     BuildContext context, {
       required String title,
       required List<Map<String, String>> cardDetails,
       required Function(String, String) onTap,
     }) {
   return Column(
     crossAxisAlignment: CrossAxisAlignment.stretch,
     children: [
       Padding(
         padding: const EdgeInsets.only(right: 24),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
             TextButton(
               onPressed: () {},
               child: const Text(
                 'View all',
                 style: TextStyle(color: Colors.green, fontSize: 16),
               ),
             ),
           ],
         ),
       ),
       const SizedBox(height: 12),
       SizedBox(
         height: 200,
         child: ListView.separated(
           scrollDirection: Axis.horizontal,
           separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 16),
           itemCount: cardDetails.length,
           itemBuilder: (BuildContext context, int index) {
             final card = cardDetails[index];
             return GestureDetector(
               onTap: () => onTap(card['title']!, card['image']!), // Pass the title and image
               child: Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(12),
                   color: Colors.black,
                   image: DecorationImage(
                     image: AssetImage('assets/images/${card['image']}'),
                     fit: BoxFit.cover,
                   ),
                 ),
                 width: 170,
                 padding: const EdgeInsets.all(12.0),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.end,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       card['title']!,
                       style: const TextStyle(
                           fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
                     ),
                     Row(
                       children: [
                         const Icon(Icons.access_time_filled, color: Colors.white, size: 16),
                         const SizedBox(width: 3),
                         Text(card['duration']!,
                             style: const TextStyle(color: Colors.white, fontSize: 12)),
                       ],
                     ),
                   ],
                 ),
               ),
             );
           },
         ),
       ),
     ],
   );
 }
}
