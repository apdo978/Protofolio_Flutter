import 'package:flutter/material.dart'; //to use the prepered widgets
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import './Screens/home_screen.dart';
import './Screens/about.dart';
import './Screens/skills.dart';
import './Screens/projects.dart';
import './Screens/experiance.dart';
import './Screens/contact.dart';
import './Screens/hire_me.dart';
import './theme/theme_provider.dart';
import './Widgets/phone_viewport_wrapper.dart';

// Protofolio App
void main() {
  AudioCache.instance = AudioCache(
    prefix: '',
  ); // to set the prefix for the audio files
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false, // to remove the debug banner
          title: "Abdelrhman's Portfolio",
          theme: themeProvider.themeData,
          themeMode: themeProvider.isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light,
          initialRoute: '/',
          routes: {
            '/': (context) => PhoneViewportWrapper(child: HomeScreen()),
            '/about': (context) => PhoneViewportWrapper(child: AboutSCreen()),
            '/skills': (context) => PhoneViewportWrapper(child: SkillsScreen()),
            '/Projects': (context) =>
                PhoneViewportWrapper(child: ProjectsScreen()),
            '/Experiance': (context) =>
                PhoneViewportWrapper(child: ExperianceScreen()),
            '/contact': (context) =>
                PhoneViewportWrapper(child: ContactScreen()),
            '/hireMe': (context) => PhoneViewportWrapper(child: HireMeScreen()),
          },
        );
      },
    );
  }
}
