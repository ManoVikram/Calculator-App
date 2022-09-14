import 'package:flutter/material.dart';
import 'package:nawgati_calculator_app/home_screen/models/providers/calculation_provider.dart';
import 'package:provider/provider.dart';

import '../home_screen/screen/home_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculationProvider(),
      child: const MaterialApp(
        title: "Nawgati Calculator",
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
