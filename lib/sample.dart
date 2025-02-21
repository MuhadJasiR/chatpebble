import 'package:flutter/material.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.amber,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.all(60),
              margin: EdgeInsets.all(30),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white, spreadRadius: 2, blurRadius: 1)
                  ],
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20)),
              child: Text("I am container"),
            )
          ],
        ),
      ),
    );
  }
}
