import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  String text;
  String sender;
  bool checkSender;

  ChatBubble(
      {super.key, required this.text, required this.sender, required this.checkSender});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: checkSender?CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Text(
              sender,
              style: const TextStyle(fontSize: 10, color: Colors.black26),
            ),
          ),
          Material(
            elevation: 10,
            color: checkSender?Colors.blueAccent:Colors.white,
            borderRadius: checkSender
                ? const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(fontSize: 20, color: checkSender?Colors.white:Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
