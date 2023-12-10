import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recepia/ui/screens/home/home.dart';

import 'provider/home_provider.dart';

void main() {
  //Api api = Api.create();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider()..init(),
        ),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
