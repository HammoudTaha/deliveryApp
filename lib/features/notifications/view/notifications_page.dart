import 'package:delivaryapp/features/notifications/widgets/custom_notifications_item.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});
  static const String id = 'notifiction_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return const CustomNotificationsItem();
        },
      ),
    );
  }
}
