import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:path/path.dart' as p;

class ChatInputWidget extends StatefulWidget {
  const ChatInputWidget({
    super.key,
  });

  @override
  State<ChatInputWidget> createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends State<ChatInputWidget> {
  bool isRecording = false;
  @override
  Widget build(BuildContext context) {
    String? recodingPath;
    final AudioRecorder audioRecorder = AudioRecorder();
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 25, left: 15, right: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 60,
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Type here...",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.attach_file,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: () async {
                log(isRecording.toString());
                if (isRecording) {
                  String? filePath = await audioRecorder.stop();
                  log(filePath.toString());
                  if (filePath != null) {
                    setState(() {
                      isRecording = false;
                      recodingPath = filePath;
                    });
                  }
                } else {
                  if (await audioRecorder.hasPermission()) {
                    final Directory appDocumentDir =
                        await getApplicationDocumentsDirectory();
                    final String filePath =
                        p.join(appDocumentDir.path, "recording.m4a");
                    await audioRecorder.start(
                        const RecordConfig(encoder: AudioEncoder.wav),
                        path: filePath);
                    setState(() {
                      isRecording = true;
                      recodingPath = null;
                    });
                  }
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(17)),
                child: Icon(
                  isRecording ? Icons.stop : Icons.mic,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
