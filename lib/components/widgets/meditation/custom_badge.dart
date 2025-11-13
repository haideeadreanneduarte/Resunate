import 'package:flutter/material.dart';


class CustomBadge extends StatelessWidget {
 const CustomBadge(
     {super.key,
       required this.icon,
       required this.text,
       required this.isContainer});


 final IconData icon;
 final String text;
 final bool isContainer;


 @override
 Widget build(BuildContext context) {
   return Container(
     decoration: BoxDecoration(
       color: isContainer ? Colors.white.withOpacity(0.5) : Colors.transparent,
       borderRadius: BorderRadius.circular(6.0),
     ),
     padding: const EdgeInsets.only(left: 3, right: 3),
     child: Row(
       children: [
         Icon(
           icon,
           color: Colors.white,
           size: 16,
         ),
         const SizedBox(
           width: 3,
         ),
         Text(
           text,
           style: const TextStyle(color: Colors.white, fontSize: 12),
         )
       ],
     ),
   );
 }
}
