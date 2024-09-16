class Message {
  const Message({this.id, required this.alias, required this.message});

  final int? id;
  final String alias;
  final String message;

  @override
  String toString() {
    return 'Alias: $alias, Message: $message';
  }

  Map<String, dynamic> toMap() {
      return {
        'id': id,
        'alias': alias,
        'message': message
      };
  }

  Message.fromMap(Map<String, dynamic> messageMap):
    id = messageMap['id'],
    alias = messageMap['alias'],
    message = messageMap['message'];
}