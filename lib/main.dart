import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'firebase_options.dart';
import 'package:resunate_final_project/components/screens/starting_page.dart';

void main()async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 5),);
  FlutterNativeSplash.remove();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterNativeSplash.remove();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resunate: Wellness & Fitness',
      theme: ThemeData(
        useMaterial3: true,
         colorScheme: const ColorScheme(
          primary: Color(0xffdbe64c), // Primary color
          primaryContainer: Color(0xfff8fadb), // Primary container color
          secondary: Color(0xff6c757d), // Secondary color
          secondaryContainer: Color(0xff495057), // Secondary container color
          surface: Colors.white, // Background color
          error: Colors.red, // Error color
          onPrimary: Colors.white, // Color for text/icons on primary color
          onSecondary: Colors.black, // Color for text/icons on secondary color
          onSurface: Colors.black, // Color for text/icons on background color
          onError: Colors.white, // Color for text/icons on error color
          brightness: Brightness.light, // Brightness (light/dark)
        ),
      ),
      home: const StartingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}