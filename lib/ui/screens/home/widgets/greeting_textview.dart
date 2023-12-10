import 'package:flutter/material.dart';

class GreetingTextView extends StatelessWidget {
  const GreetingTextView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello",
          style: TextStyle(
            fontSize: 22,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "What would you like\nto cook today?",
          style: TextStyle(
            fontSize: 28,
            color: Colors.black87,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
