import 'package:chatpebble/core/const_size.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: false,
          toolbarHeight: 70,
          elevation: 0,
          title:
              Text("Messages", style: Theme.of(context).textTheme.titleLarge),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 100,
              padding: const EdgeInsets.all(5),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildRecentContact("jasir", context),
                  _buildRecentContact("ali", context),
                  _buildRecentContact("ali", context),
                  _buildRecentContact("ali", context),
                  _buildRecentContact("ali", context),
                  _buildRecentContact("ali", context),
                ],
              ),
            )
          ],
        ));
  }

  Widget _buildRecentContact(String name, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        children: [
          const CircleAvatar(
            // backgroundImage: NetworkImage("http://via.placeholder.com/150"),
            radius: 30,
          ),
          kHeight(5),
          Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
