import 'dart:convert';
import 'package:googleapis_auth/auth_io.dart' as auth;

class NotificationSenderExample {
  static String projectId = "YOUR_PROJECT_ID_HERE";
  
  static String servicesData = r'''{
  "type": "service_account",
  "project_id": "YOUR_PROJECT_ID_HERE",
  "private_key_id": "YOUR_PRIVATE_KEY_ID_HERE",
  "private_key": "-----BEGIN PRIVATE KEY-----\nYOUR_PRIVATE_KEY_HERE\n-----END PRIVATE KEY-----\n",
  "client_email": "YOUR_CLIENT_EMAIL_HERE",
  "client_id": "YOUR_CLIENT_ID_HERE",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "YOUR_CERT_URL_HERE",
  "universe_domain": "googleapis.com"
}''';
  static Future<void> sendNotificationToSelectToken({
    required String fcmToken,
    required String title,
    required String body,
    Map<String, dynamic>? data,
  }) async {
    if (fcmToken.trim().isEmpty) {
      throw ArgumentError('fcmToken is empty');
    }
    final serviceAccount = jsonDecode(servicesData) as Map<String, dynamic>;
    final credentials = auth.ServiceAccountCredentials.fromJson(serviceAccount);
    final client = await auth.clientViaServiceAccount(credentials, [
      'https://www.googleapis.com/auth/firebase.messaging',
    ]);

    try {
      final response = await client.post(
        Uri.parse(
          'https://fcm.googleapis.com/v1/projects/$projectId/messages:send',
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'message': {
            'token': fcmToken.trim(),
            'notification': {'title': title, 'body': body},
            'data': data,
            'android': {
              'priority': 'high',
              'notification': {'sound': 'default'},
            },
          },
        }),
      );
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception('sorry could not send a notification');
      }
    } finally {
      client.close();
    }
  }
}
