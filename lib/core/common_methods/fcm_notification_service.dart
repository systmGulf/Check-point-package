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
    // var accessToken = await getAccessToken();
    // log(accessToken);

    // Foreground Notification
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      LocalNotificationService.showbasicNotification(
          massBody: message.notification!.body!,
          title: message.notification!.title!);
    });
  }

  static Future<void> backgroundMessageHandler(RemoteMessage message) async {}
  // static Future<String> getAccessToken() async {
  //   final serviceAccountJson = {
  //     "type": "service_account",
  //     "project_id": "employee-mangement-syste-26e0d",
  //     "private_key_id": "d6740d5e8a25b604c71e29c21d0be0fe6a6a7e7e",
  //     "private_key":
  //         "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCS4gQIIafuU0Wl\n+kc81lWxN+tnc/6pSQWpobNCDwJDzTmqY6ZsCJorpt/zhDu8X48955oQMSshKxrm\nJYHhoN5AoF0UDYAUw0RgFQ2216uVbSPyUkIkGwlFxr0z6DbWu9KQfMdWvKVYkaYE\n+NmiJDATMLP6tsXUEgnryiro3uxtnzYBPUjcx39rNMf4SDEiUwxbvB25LY8dY4yH\njm05RB1EGF4Wui342YNZK1uc8FQdKI2KRLNTXPASAiFMiGLsw21gTvI49t+LFXSe\ny52zhmw0KlP1SGmzGKJsJ7yRA/Vsz34KJNFqK4yqqX/hYTxJTji4Glltr4nIlVJY\nPBtYyimXAgMBAAECggEAIhzMq+jJHBAJ4mjUZ5wtralbihzF3aIAZyuPOr3KnF2K\n0XgwO/HpgE7SvzcMOo0E8u8ZeD47Eop0xlOarQCT7XVw+InEH85T0G7DTx4akusU\niKAzDTicODDWWzpIlilr1zOrhgjs67tzz77NqJr38VUDz6voGP8Rf8nlmky/oxuX\nCjACn2XwK+55o70MqUeOf8v6g3yOlUjvvDobHOqyiZKWt/59kKvFnLUdavlOfYuM\ndi4o4DhxfgJRMIZ8iLfSYGREkqyZdIpup4qW526IoQEGpAQJAlZH5e9wz+BQRUD1\nLQDkmGAjLBa68cCY3NY1vNd3YprR/PdTjl3SfWE2XQKBgQDOnXJMHiu0DscBxA/N\nogflqJgKsjnNIAmpDCzSucXEwIY2+owoVBKX3tM02KKh0BvtoCfaw4m9SdMPpGwg\nSlYXd56yEoosYzHlvcBWMnkPqv2ljxoKZK4qfqjW165UCRbQ0X0NwdxeDqhJb8bM\nrY8DuA6NADK2IZR2QzzjiTPNvQKBgQC1/Z9cY8Y2N47j9l0ZR6it5ZDfun+RavaE\n5StwcvdcvU9TBjF6OYoFNkOP9l8DPzb1g1o17a4vA+VhNxbeYP5Z3cdV+Wm2Uuxc\nHC95wptgDxJDj70tWtLhJXkzJ75UL/BgFo2EE1X1oTqTIslpIk842diDJxYiXMhJ\nhdLb9OXX4wKBgD0i2W8sfkIJHVmoagSurSeHe3WuxuurTzB2Kc0wqxRM42nhORe1\nyMqnZFd+wqCes6Tcfu58bYVVEt7OCDCFznOjMZH/amM39svEGeVnierY7bTPYyUw\nJVjtoYfwyeSTy+x+EELB2jL6o1EXgfuOX4L6M1QFevvpc8SKoLmzH2EBAoGBALET\nWLbVoevo/RCUCxvo3JhvURpPZYaBk+HU9gJQ6pyC2qcG1Kd/SustVGnEJ8iJ/pi+\nOM1WOXAnk02XA5pWt8WLBESEDLbJUo+BITSRBQtfPr8cIc76m0tUYexDVG6nwnRM\nHWAQTEhWmx7E70JrjrfbR069fkzrCDp5iqRYUjdPAoGAQde7yuOnIUu2HvZRy+DC\nf+T9nbhUORXYPwh92sUlwFVZD0zvf7AcxEb8E3UtmyzyctQ8B8OikdhnNcePQUp7\neHSZyjTN+6gEcLLyxS5viMNFHKhCnOkQU5wJ8Bmnl6BN2cIGkWhhUGYw+fXK9+2d\nf+HzoPMqtC6ixXrPZYMTtz4=\n-----END PRIVATE KEY-----\n",
  //     "client_email":
  //         "firebase-adminsdk-de0dg@employee-mangement-syste-26e0d.iam.gserviceaccount.com",
  //     "client_id": "102540025524583792124",
  //     "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  //     "token_uri": "https://oauth2.googleapis.com/token",
  //     "auth_provider_x509_cert_url":
  //         "https://www.googleapis.com/oauth2/v1/certs",
  //     "client_x509_cert_url":
  //         "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-de0dg%40employee-mangement-syste-26e0d.iam.gserviceaccount.com",
  //     "universe_domain": "googleapis.com"
  //   };
  //   List<String> scopes = [
  //     "https://www.googleapis.com/auth/userinfo.email",
  //     "https://www.googleapis.com/auth/firebase.database",
  //     "https://www.googleapis.com/auth/firebase.messaging",
  //   ];
  //   http.Client clinent = await clientViaServiceAccount(
  //     ServiceAccountCredentials.fromJson(serviceAccountJson),
  //     scopes,
  //   );
  //   AccessCredentials credentials =
  //       await obtainAccessCredentialsViaServiceAccount(
  //           ServiceAccountCredentials.fromJson(serviceAccountJson),
  //           scopes,
  //           clinent);
  //   clinent.close();
  //   return credentials.accessToken.data;
  // }

  // static sendNotification(
  //     String token, String title, String notificationBody) async {
  //   final String serverKey = await getAccessToken();

  //   // print(serverKey);
  //   final currentFCMToken = await FirebaseMessaging.instance.getToken();

  //   log(currentFCMToken.toString());
  //   if (currentFCMToken != null) {
  //     String endpointFirebaseCloudMessaging =
  //         "https://fcm.googleapis.com/v1/projects/employee-mangement-syste-26e0d/messages:send";
  //     final Map<String, dynamic> body = {
  //       "message": {
  //         "token": token,
  //         "data": {
  //           "title": title,
  //           "body": notificationBody,
  //         },
  //         "android": {
  //           "notification": {
  //             "title": title,
  //             "body": notificationBody,
  //           }
  //         },
  //         "webpush": {
  //           "notification": {
  //             "title": title,
  //             "body": notificationBody,
  //           }
  //         },
  //         "notification": {
  //           "title": title,
  //           "body": notificationBody,
  //         }
  //       }
  //     };
  //     final http.Response response = await http.post(
  //       Uri.parse(endpointFirebaseCloudMessaging),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $serverKey',
  //       },
  //       body: jsonEncode(body),
  //     );

  //     if (response.statusCode == 200) {
  //     } else {}
  //   }
  // }
}
