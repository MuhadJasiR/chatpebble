import 'package:chatpebble/presentation/api/api_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    ApiService().fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
