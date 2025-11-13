import 'package:flutter/material.dart';


class MusicDetails extends StatelessWidget {
 final String title;
 final String backgroundImage;


 MusicDetails({super.key, required this.title, required this.backgroundImage});


 final Map<String, String> descriptions = {
   'Inner Light': 'This music piece is perfect for moments when you need to unwind and find peace. The serene tones create an atmosphere of tranquility, helping to soothe the mind and reduce stress. It’s ideal for meditation, deep relaxation, or simply finding a moment of stillness during a busy day.',
   'Serenity Waves': 'Evokes the soothing sounds of the ocean, making it an excellent track for calming the mind and enhancing focus. The rhythmic motion of the waves combined with gentle, ambient sounds encourages a sense of balance and harmony, perfect for relaxation or mindfulness exercises.',
   'Classical': 'This classical piece brings timeless elegance and sophistication, offering a refined auditory experience. It can help stimulate the mind while promoting relaxation, making it suitable for background music during work, study sessions, or moments of reflection.',
   'Whispering Forest': 'Immerses listeners in the natural world with sounds that transport you to a peaceful woodland. Featuring gentle rustling leaves, birdsong, and distant wildlife, this music is designed to reduce stress and create a grounding experience that reconnects you with nature.',
   'Purity': 'Embodies simplicity and clarity with its clear, serene soundscapes. This track helps cleanse the mind of clutter and promotes a state of purity and focus. It’s an ideal background for meditation, yoga, or moments when you seek to center yourself and find mental clarity.',
 };


 final Map<String, String> musicUrls = {
   'Serenity Waves': 'https://youtu.be/C1wFmXGPbUg?si=26D3VNpx5aCikuQo',
   'Waves': 'https://youtu.be/jbtel9K6fVY?si=twrQMuc3hY1Ipwfb',
   'Classical': 'https://youtu.be/JGJPVl7iQUM?si=APymP9burPlEniMH',
   'Whispering Forest': 'https://youtu.be/baSEW7nmi7g?si=B416N97_QO2w8b_K',
   'Purity': 'https://youtu.be/Lox_jyvBBEk?si=1uhdA-BarQ3BHiTJ',
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
                 'Music Session',
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
