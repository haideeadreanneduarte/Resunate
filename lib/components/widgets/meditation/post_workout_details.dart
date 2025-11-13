import 'package:flutter/material.dart';


class PostWorkoutDetails extends StatelessWidget {
 final String title;
 final String backgroundImage;


 PostWorkoutDetails({super.key, required this.title, required this.backgroundImage});


 final Map<String, String> descriptions = {
   'Recovery': 'Focus on muscle recovery with gentle stretches and relaxation techniques. Perfect for unwinding after intense workouts.',
   'Flexibility': 'Enhance your flexibility with this guided session. Ideal for improving range of motion and preventing soreness.',
   'Relaxation': 'Calm your mind and body with this relaxing cooldown session. A great way to de-stress and rejuvenate after exercise.',
   'Mobility': 'Boost your mobility with exercises designed to improve joint health and overall movement efficiency.',
   'Cool Down': 'Wind down your workout with this essential cooldown session, combining deep breathing and light stretching.',
 };


 final Map<String, String> videoUrls = {
   'Cool Down Stretch': 'https://youtu.be/someCoolDownVideoUrl',
   'Post-Workout Relaxation': 'https://youtu.be/someRelaxationVideoUrl',
   // Add more video URLs here if needed
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
                 'Post-Workout Session',
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
