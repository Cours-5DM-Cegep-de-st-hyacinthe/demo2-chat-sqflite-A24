import 'package:chatflutter/model/message.dart';
import 'package:flutter/material.dart';

class VueListeMessage extends StatelessWidget {
  const VueListeMessage({super.key, required this.messages});
  final List<Message> messages;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          for(var message in messages)
            Row(
              key: Key('listeMessage${message.id}'),
              children: [Text(message.toString())],
            )
        ],
      ));
  }
}