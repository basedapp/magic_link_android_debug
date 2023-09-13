import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recase/recase.dart';

final screens = [
  "logged in",
  "auth",
  "log out",
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body:  SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...screens.map((screen) {
              return TextButton(
                onPressed: () {
                  final path = "/${screen.snakeCase}";
                  print(path);
                  context.push(path);
                },
                child: Text("$screen Screen".sentenceCase),
                );
            })
          ],
        ),
      ),
    );
  }
}
