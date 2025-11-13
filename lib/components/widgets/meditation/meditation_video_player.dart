import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class MeditationVideoPlayer extends StatefulWidget {
 final String videoUrl; // The full URL or just the video ID


 const MeditationVideoPlayer({super.key, required this.videoUrl});


 @override
 _MeditationVideoPlayerState createState() => _MeditationVideoPlayerState();
}


class _MeditationVideoPlayerState extends State<MeditationVideoPlayer> {
 late YoutubePlayerController _controller;


 @override
 void initState() {
   super.initState();
   _controller = YoutubePlayerController(
     initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
     flags: YoutubePlayerFlags(
       autoPlay: true,
       mute: false,
     ),
   );
 }


 @override
 Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white, // Set the background color for the app
     body: Column(
       children: [
         // The video player section
         Container(
           color: Colors.black,
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: YoutubePlayer(
               controller: _controller,
               showVideoProgressIndicator: true,
               onReady: () {
                 print('Player is ready.');
               },
             ),
           ),
         ),
         // The content below the video
         Expanded(
           child: Container(
             padding: EdgeInsets.all(16),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   'Enjoy Your Meditation',
                   style: TextStyle(
                     color: Colors.black,
                     fontSize: 26,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 SizedBox(height: 8),
                 Text(
                   'Relax and take a moment to let go of stress. Follow the guided meditation to rejuvenate your mind and soul.',
                   style: TextStyle(
                     color: Colors.black87,
                     fontSize: 16,
                     letterSpacing: 0.5,
                   ),
                 ),
                 Spacer(),
                 ElevatedButton(
                   onPressed: () {
                     Navigator.pop(context);
                   },
                   style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.orangeAccent,
                     padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                     elevation: 5,
                     shadowColor: Colors.orangeAccent.withOpacity(0.5),
                   ),
                   child: Text(
                     'Finish Meditation',
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 18,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
               ],
             ),
           ),
         ),
       ],
     ),
   );
 }


 @override
 void dispose() {
   _controller.dispose();
   super.dispose();
 }
}
