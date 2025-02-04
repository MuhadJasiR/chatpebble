import 'package:chatpebble/core/theme.dart';
import 'package:chatpebble/message_page.dart';
import 'package:chatpebble/presentation/chat/chat_screen.dart';
import 'package:chatpebble/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const HomeScreen(),
    );
  }
}
