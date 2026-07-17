import 'package:focal_project/model/message_model.dart';

class ChatDetailsService {
  List<MessageModel> getMessages(int chatId) {
    return [
      MessageModel(
        id: 1,
        senderName: 'Ahmir',
        text: 'hi for this hotel with a king sweet room are there still any vacancies?',
        time: '10.15 AM',
        isMe: true,
      ),
      MessageModel(
        id: 2,
        senderName: 'Jhone Endrue',
        text: 'Hi Ahmir',
        time: '10.30 AM',
        isMe: false,
      ),
      MessageModel(
        id: 3,
        senderName: 'Jhone Endrue',
        text: 'Yes the room is available, so you can make an order.',
        time: '10.31 AM',
        isMe: false,
      ),
    ];
  }
}