import 'package:chatpebble/core/const_size.dart';
import 'package:chatpebble/core/theme.dart';
import 'package:chatpebble/presentation/chat/widgets/chat_input_widget.dart';
import 'package:chatpebble/presentation/chat/widgets/filter_button.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.greyColor50,
      appBar: AppBar(
        backgroundColor: DefaultColors.greyColor50,
        toolbarHeight: 70.0,
        title: Row(
          children: [
            const CircleAvatar(),
            kWidth(10),
            const Text("Michael Knight"),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: Column(
        children: [
          const FilterButtonWidget(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              itemCount: 3,
              itemBuilder: (context, index) {
                if (index.isEven) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: DefaultColors.greyColor100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("Example received message"),
                    ),
                  );
                } else {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: DefaultColors.blueColor100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("Example sent message"),
                    ),
                  );
                }
              },
            ),
          ),
          const ChatInputWidget(),
        ],
      ),
    );
  }
}
