import 'package:focal_project/model/notification_model.dart';

class NotificationService {
  List<NotificationModel> getNotifications() {
    return [
      

      NotificationModel(
        id: 2,
        image: "https://randomuser.me/api/portraits/men/2.jpg",
        title: "Discount",
        body: '20% discount if you stay on Saturday',
        time: "2 hours ago",
        category: "Discounts",
        section: 'Yesterday',
      ),

      
    ];
  }
}
