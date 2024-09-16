import 'package:chatflutter/controleur/message_controleur.dart';
import 'package:chatflutter/database/database.dart';
import 'package:chatflutter/model/message.dart';
import 'vue_liste_message.dart';
import 'package:chatflutter/vue/vue_envoyer_message.dart';
import 'package:flutter/material.dart';

class PagePrincipale extends StatefulWidget{
  const PagePrincipale({super.key});

  @override
  State<PagePrincipale> createState() {
    return _PagePrincipaleState();
  }
}

class _PagePrincipaleState extends State<PagePrincipale> {
  List<Message>? messages;

  final MessageControleur _messageControleur = MessageControleur();

  @override
  void initState() {
    super.initState();

    messages = [];
    _loadMessage();
  }

  Future<void> _loadMessage() async {
    var nouveauxMessages = await _messageControleur.getMessages();

    setState(() {
      messages = nouveauxMessages;
    });
  }

  Future<void> _sauvegarderMessage(String alias, String message) async {
    await _messageControleur.sauvegarderMessage(Message(alias: alias, message: message));
    
    _loadMessage();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      VueListeMessage(messages: messages!),
      VueEnvoyerMessage(envoyerMessage: _sauvegarderMessage)
    ]);
  }
  
}