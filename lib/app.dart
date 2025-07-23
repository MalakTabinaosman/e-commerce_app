
import 'package:e_commerce_app/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme:AppThemeData.lighTheme ,
      darkTheme: AppThemeData.darkTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
      ),
    );
  }
}