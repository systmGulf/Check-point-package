import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

import 'local_notifications_service.dart';

abstract class FcmNotificationService {
  static Future<void> init() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    final currentFCMToken = await FirebaseMessaging.instance.getToken();
    log(currentFCMToken.toString());
    // background And Killed Notification
    FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
    var accessToken = await getAccessToken();
    log(accessToken);

    // Foreground Notification
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      LocalNotificationService.showbasicNotification(
          massBody: message.notification!.body!,
          title: message.notification!.title!);
    });
  }

  static Future<void> backgroundMessageHandler(RemoteMessage message) async {}
  static Future<String> getAccessToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "employee-mangement-syste-26e0d",
      "private_key_id": "d423f9bfb588bcd3a7d2ff72723bb1651c651501",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCiuM6FePv2NKBg\nS760+5KkK8FmAn84VQ7YhpkJTrzzEk9fnyW8pdSH6wZ5Q62+6AJybrZwQaXih8m/\n7ZPAG996yWgFifiwA2AI7EEUUJFwv1+0qbxZHESdG3HznXzVKwhT6ec7nqWjINr+\nWiB53z01c1hCODQN7dVRAxEX5kT6CeKy10aW2HS2TFcGw79M/y47VyiOBicnA5av\nc6QxCsdTtxWT8yS/ovjkMsrnCT4qMQWYrsocojoD7ZJlDZrse+zZ2SzqGJNdDX7g\nv2VROXMpTkmdQLQ7ZAXyKX2XHXoKennmv/wcw/3mpmOfdptjNQmNaCk1FhWAcVvM\n6VTwMGx3AgMBAAECggEADwYnM1WnVeUoBZwYwJcVxAiyM5v5aRcZZs6OpLhbY8oG\nABsunctl4yLFFz8zdJPxXeVw/M5i5ZaJ/ymNYchxCuI7s384se+t10URATIrK5DP\n4ltlo4ijoSnejJK26uutOio3il6shnJLJf7mTrpY6W178alEzSBveKpi0qUVK0zG\nhheVdOMyaTRiH57j3JcRYot1Q95NaXf5T3qEQ/7vq5yJMKLMPL6hqCWcVsYrvJ74\nYOWkhMv4aoV0oitGT98sV/Ib6CdLeFmx6zculRPYlpnUtSAWlkG3ysSSr4siO9rp\nhifkLAR8Lul+ltiMdjT9+fkj1Y2ltbo1SnN5ENj2eQKBgQDfC4aiHrzXdjh0MtrS\nVTXgzbFC3EUBm38cpkFyP/+vKLCkRU9tBFzsb4MT+iJ68RCeGasnU51AFkd7y6id\nyhyyPrfxfp57sVAZBkKqueuk/vr/Fo4E/XK8+UCkTXoZo9PLrpPx75IGwl9jkQK8\ngv6nMwqIDmxUBlb1ldm/29O7BQKBgQC6w50nF+qRWFQNTcvBdLjYl7U4buKkWVMy\nxY3td5I8vZFt//3AoqgOn3KPb8cjOgcFI0qm3tRFmEdQXTzcgmNzVa9OMWxQ+DlY\nnXnnIR9IHh+JWp9nmf1h/136UxSOr3SSrLXcvhyB2YjPDOx5mmL300Y96WHSmHDU\n8nLlvtu6SwKBgDVz864Co8sXH+xpC5wAo8reQK7/TuJVu57IEUMqJ0J5A+w6WBCO\nTR60krtE5OKFxy+8gxIHrdXgAP2gDybRexMUiMytRZnrIoD8yRlVOS3vlYNwilST\n0N2M9nrpvmtKocVcb0Q538sS5f1ckUVQN2smhk2Y90kjw89TPD4IlrNpAoGAbXtS\nWqJofT98NjhOo19bJIz6TNSjw5ghb3fjlTss3LJ72DHifNRdFAVgULlD0WCo0Ng5\nYMzrPsjftTqS/Ojqh6fJFltelbCNXWcjGNyPy+Tss8YN/9uDb7kVTDL7sBEmkvzv\ntzEy4OO2kTmQPlDEh2awnIZ9M8jtC8f8lrVldTUCgYEAjQ1aasDfU3srmnLBho49\nmfbTi6dXXgG/JCYt7gUlWI3I/Ed53QA794lom2qIbitGEiCZZA4MY8S7y2loA231\nXIFqjDlMHScoqbRrCd5etkJlTTAOyxB0uog6Pe/9qkiq1S2YZTL1kU2STTc9uS5Z\nvJ2phtgciD9NVkDCDHNAo4Y=\n-----END PRIVATE KEY-----\n",
      "client_email":
          "firebase-adminsdk-de0dg@employee-mangement-syste-26e0d.iam.gserviceaccount.com",
      "client_id": "102540025524583792124",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-de0dg%40employee-mangement-syste-26e0d.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };
    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging",
    ];
    http.Client clinent = await clientViaServiceAccount(
      ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );
    AccessCredentials credentials =
        await obtainAccessCredentialsViaServiceAccount(
            ServiceAccountCredentials.fromJson(serviceAccountJson),
            scopes,
            clinent);
    clinent.close();
    return credentials.accessToken.data;
  }

  static sendNotification(
      String token, String title, String notificationBody) async {
    final String serverKey = await getAccessToken();

    // print(serverKey);
    final currentFCMToken = await FirebaseMessaging.instance.getToken();

    log(currentFCMToken.toString());
    if (currentFCMToken != null) {
      String endpointFirebaseCloudMessaging =
          "https://fcm.googleapis.com/v1/projects/employee-mangement-syste-26e0d/messages:send";
      final Map<String, dynamic> body = {
        "message": {
          "token": token,
          "data": {
            "title": title,
            "body": notificationBody,
          },
          "android": {
            "notification": {
              "title": title,
              "body": notificationBody,
            }
          },
          "webpush": {
            "notification": {
              "title": title,
              "body": notificationBody,
            }
          },
          "notification": {
            "title": title,
            "body": notificationBody,
          }
        }
      };
      final http.Response response = await http.post(
        Uri.parse(endpointFirebaseCloudMessaging),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $serverKey',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
      } else {}
    }
  }
}
