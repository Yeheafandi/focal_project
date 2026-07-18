import 'package:focal_project/model/notification_model.dart';

class NotificationService {
  List<NotificationModel> getNotifications() {
    return [
      NotificationModel(
        id: 1,
        image: "https://randomuser.me/api/portraits/men/1.jpg",
        title: "Hotel Eliminate Galian has added new accommodation rooms",
        time: "2 hours ago",
        category: "New Notification",
        section: 'Today',
      ),

      NotificationModel(
        id: 2,
        image: "https://randomuser.me/api/portraits/men/2.jpg",
        title: "20% discount if you stay on Saturday",
        time: "2 hours ago",
        category: "Discounts",
        section: 'Yesterday',
      ),

      NotificationModel(
        id: 3,
        image: "https://randomuser.me/api/portraits/women/5.jpg",
        title: "Congratulations, you successfully booked a room",
        time: "2 hours ago",
        category: "By Chat",
        section: 'Today',
      ),
    ];
  }
}
