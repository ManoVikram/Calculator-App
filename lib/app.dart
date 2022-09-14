import 'package:flutter/material.dart';

import '../home_screen/screen/home_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Nawgati Calculator",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
