
import 'package:flutter/material.dart';


class BreathingDetails extends StatelessWidget {
 final String title;
 final String backgroundImage;


 BreathingDetails({super.key, required this.title, required this.backgroundImage});


 final Map<String, String> descriptions = {
   'Calm': 'Focus on slow, deep breaths to cultivate a sense of calm and relaxation. Perfect for unwinding after a busy day.',
   'Anxiety-Relief': 'A guided breathing exercise to alleviate anxiety and stress, helping you find inner peace.',
   'Box Breathing': 'Practice the box breathing technique to enhance focus, balance, and calmness in your day-to-day activities.',
   'Progressive Relaxation': 'Relax each part of your body progressively, combining mindfulness and deep breathing for ultimate relaxation.',
   'Guided Visualization': 'Pair your breathing with visualization exercises to reduce tension and promote positivity.',
 };


 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: Stack(
       children: [
         // Background Image
         Container(
           decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage("assets/images/$backgroundImage"),
               fit: BoxFit.cover,
             ),
           ),
         ),


         Container(
           color: Colors.black.withOpacity(0.6),
         ),
         // Content
         Padding(
           padding: const EdgeInsets.all(12.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Text(
                 title,
                 style: const TextStyle(
                     color: Colors.white, fontWeight: FontWeight.w900, fontSize: 40),
               ),
               const Text(
                 'Breathing Exercise',
                 style: TextStyle(color: Colors.yellow, fontSize: 25, fontWeight: FontWeight.w300),
               ),
               const SizedBox(height: 12),
               Container(
                 decoration: BoxDecoration(
                     color: Colors.white, borderRadius: BorderRadius.circular(24)),
                 padding: const EdgeInsets.all(24.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.stretch,
                   children: [
                     const Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Column(
                           children: [
                             Icon(Icons.mic, size: 30),
                             Text('Guided', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
                           ],
                         ),
                         SizedBox(
                           height: 50,
                           child: VerticalDivider(color: Colors.black),
                         ),
                         Column(
                           children: [
                             Icon(Icons.access_time_filled, size: 30),
                             Text('5 Mins', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                           ],
                         ),
                       ],
                     ),
                     const SizedBox(height: 12),
                     Text(
                       descriptions[title] ?? 'No description available for this session.',
                       style: const TextStyle(fontSize: 16),
                     ),
                     const SizedBox(height: 12),
                     ElevatedButton(
                       onPressed: () {
                         // Add your start button action here
                       },
                       style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                       child: const Text(
                         'Start',
                         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                       ),
                     ),
                   ],
                 ),
               ),
               const SizedBox(height: 50),
             ],
           ),
         ),
       ],
     ),
   );
 }
}
