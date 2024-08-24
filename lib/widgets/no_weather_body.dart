import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'There is no weather 😔 start',
            style: TextStyle(
              fontSize: 28,
              color: Color.fromARGB(248, 136, 136, 136),
            ),
          ),
          Text(
            'searching now 🔍',
            style: TextStyle(
              fontSize: 28,
              color: Color.fromARGB(248, 136, 136, 136),
            ),
          ),
        ],
      ),
    );
  }
}
