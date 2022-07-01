import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Container(
        child: Text(
          GlobalVariables.messageOrder,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
