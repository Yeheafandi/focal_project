import 'package:focal_project/model/chat_model.dart';

class MessageService {
  List<ChatModel> getChats() {
    return [
      ChatModel(
        id: 1,
        name: 'James Collins',
        image:
            'https://randomuser.me/api/portraits/men/1.jpg',
        lastMessage: 'Hey! How are you?',
        time: '09:24',
        unreadCount: 2,
      ),

      ChatModel(
        id: 2,
        name: 'Olivia Brown',
        image:
            'https://randomuser.me/api/portraits/women/2.jpg',
        lastMessage: 'Thank you 😊',
        time: 'Yesterday',
        unreadCount: 0,
      ),

      ChatModel(
        id: 3,
        name: 'William Smith',
        image:
            'https://randomuser.me/api/portraits/men/3.jpg',
        lastMessage: 'See you tomorrow.',
        time: '10:11',
        unreadCount: 5,
      ),
    ];
  }
}