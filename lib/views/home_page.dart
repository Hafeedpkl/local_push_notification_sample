import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:push_notification/api/notification_api.dart';
import 'package:push_notification/views/second_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    NotificationApi.initNotification();
    NotificationApi.init();
    listenNotifications();
    super.initState();
  }

  void listenNotifications() =>
      NotificationApi.onNotification.stream.listen(onClickNotification);
  void onClickNotification(String? payload) {
    log(payload!);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondPage(payload: payload),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Push Notification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Local Notifications",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            notification_button(
                Icon(
                  Icons.notifications,
                ),
                'Simple notification',
                () => NotificationApi.showNotification(
                    title: 'hafeed',
                    body: 'hello this is a sample of push notification',
                    payload: 'hafeed\'s payload')),
            notification_button(
                Icon(
                  Icons.notifications_active,
                ),
                'Sheduled notification', () {
              NotificationApi.showScheduledNotification(
                  title: 'Reminder',
                  body: "you setted a 2 second reminder",
                  payload: 'hafeed.reminder',
                  seconds: 2);
            }),
          ],
        ),
      ),
    );
  }

  ElevatedButton notification_button(
      Icon icon, String text, Function() onpressed) {
    return ElevatedButton.icon(
        onPressed: onpressed,
        icon: icon,
        label: Text(
          text,
        ));
  }
}
