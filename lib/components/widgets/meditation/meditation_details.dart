import 'package:flutter/material.dart';
import 'meditation_video_player.dart';


class MeditationDetails extends StatelessWidget {
 final String title;
 final String backgroundImage;


 MeditationDetails({super.key, required this.title, required this.backgroundImage});


 // Map to hold unique descriptions for each meditation session
 final Map<String, String> descriptions = {
   'Positive Energy': 'Start your day with this 5 minute meditation for positive energy, refreshing your energy with visualization and positive affirmations. This 5 min meditation will help you cultivate gratitude, positivity, and motivation for your day. Great for beginners and all levels.',
   'Self Love': 'This meditation includes full body relaxation, self love affirmations, gratitude and energy visualization exercises. Great for beginners and all levels.',
   'Stress & Anxiety': 'Enjoy this 15 minute guided meditation for anxiety and stress. Relax and release tension from your mind and body. Use this meditation to cultivate gratitude, positive energy and peace. This meditation includes gentle neck stretches, full body relaxation, positive affirmations and visualization. Great for beginners and all levels.',
   'Healing': 'A 10 minute guided meditation for healing, letting go, and inner peace. Heal your heart & emotional wounds with positive energy visualization, energy healing heart chakra tapping, and positive affirmations. This healing meditation will help you cultivate gratitude, self forgiveness, and perspective for your journey. Great for beginners and all levels.',
   'Abundance': 'Start your day with this 5 minute meditation for abundance, positive energy and powerful visualization. This 5 min meditation will help you cultivate more positivity & manifest abundance in your life. Great for beginners and all levels. Use this as a daily morning meditation, or an evening meditation before sleep.'
 };


 // Map to hold unique video URLs for each meditation session
 final Map<String, String> videoUrls = {
   'Positive Energy': 'https://youtu.be/j734gLbQFbU?si=RP-7X8JZBdQGChKt',
   'Self Love': 'https://youtu.be/P-8ALcF8AGE?si=Z9L4fAQ7vEkBbYFN',
   'Stress & Anxiety': 'https://youtu.be/pxWOpGm4d7U?si=PHNZBD2iws9axTY3',
   'Healing': 'https://youtu.be/vtOAnC73xtk?si=rNB6SQTlasSRUs6V',
   'Abundance': 'https://youtu.be/8bBPJ1EEUCc?si=-nkPi_mNInD-Z6eF',
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
         // Dark overlay on top of the background image
         Container(
           color: Colors.black.withOpacity(0.6), // Darken the whole background
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
                 'Morning Meditation',
                 style: TextStyle(
                     color: Colors.yellow,
                     fontSize: 25,
                     fontWeight: FontWeight.w300),
               ),
               const SizedBox(
                 height: 12,
               ),
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
                             Icon(
                               Icons.mic,
                               size: 30,
                             ),
                             Text(
                               'Guided',
                               style: TextStyle(
                                   fontWeight: FontWeight.w900, fontSize: 16),
                             ),
                           ],
                         ),
                         SizedBox(
                           height: 50,
                           child: VerticalDivider(
                             color: Colors.black,
                           ),
                         ),
                         Column(
                           children: [
                             Icon(
                               Icons.access_time_filled,
                               size: 30,
                             ),
                             Text(
                               '5 Mins',
                               style: TextStyle(
                                   fontWeight: FontWeight.bold, fontSize: 16),
                             ),
                           ],
                         ),
                       ],
                     ),
                     const SizedBox(
                       height: 12,
                     ),
                     Text(
                       descriptions[title] ?? 'No description available for this session.',
                       style: const TextStyle(fontSize: 16),
                     ),
                     const SizedBox(
                       height: 12,
                     ),
                     ElevatedButton(
                       onPressed: () {
                         final String? videoUrl = videoUrls[title];
                         if (videoUrl != null) {
                           Navigator.push(
                             context,
                             MaterialPageRoute(
                               builder: (context) => MeditationVideoPlayer(videoUrl: videoUrl),
                             ),
                           );
                         } else {
                           // Handle the case where a video URL isn't found
                           print('Video URL not found for $title');
                         }
                       },
                       style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                       child: const Text(
                         'Start',
                         style: TextStyle(
                             color: Colors.white, fontWeight: FontWeight.bold),
                       ),
                     ),
                   ],
                 ),
               ),
               const SizedBox(
                 height: 50,
               ),
             ],
           ),
         ),
       ],
     ),
   );
 }
}
