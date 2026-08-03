
class MessageModel {
  final int id;
  final String senderName;
  final String text;
  final String time;
  final bool isMe; 
  

  MessageModel({
    required this.id,
    required this.senderName,
    required this.text,
    required this.time,
    required this.isMe,
    
  });
}
