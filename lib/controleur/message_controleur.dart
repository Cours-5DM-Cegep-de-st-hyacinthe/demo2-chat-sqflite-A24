import 'package:chatflutter/database/database.dart';
import 'package:chatflutter/model/message.dart';

class MessageControleur {
  Future<List<Message>> getMessages() async {
    var db = DatabaseHandler();
    List<Message> messages = [];

    List<Map<String, dynamic>>? listeMessage = await db.database?.query('Message');

    for(Map<String, dynamic> message in listeMessage!) {
      messages.add(Message.fromMap(message));
    }

    return messages;
  }

  Future<void> sauvegarderMessage(Message nouveauMessage) async {
    var db = DatabaseHandler();

    await db.database!.insert('Message', nouveauMessage.toMap());
  }
}