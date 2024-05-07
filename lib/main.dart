import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // Ensure this is the correct import for localization
import 'package:multi_lingual_app/home.dart';
 import 'package:multi_lingual_app/locale.dart'; // Ensure you have this file correctly set up for localization

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    
   );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Assuming FlutterLocalization is a custom implementation for localization
  // final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  void initState() {
    super.initState();
    // Removed for brevity and because the implementation was not fully provided
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      // Ensure these are correctly set up for your localization
      // supportedLocales: localization.supportedLocales,
      // localizationsDelegates: localization.localizationsDelegates,
    );
  }
}
