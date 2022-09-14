import 'package:flutter/material.dart';

import '../widgets/calc_display.dart';
import '../widgets/number_pad.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF23242D),
      body: Column(
        children: [
          CalcDisplay(),
          const NumberPad(),
        ],
      ),
    );
  }
}
