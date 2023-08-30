import 'package:flutter/material.dart';
import 'package:instagram/presentation/widgets/custom_text.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText(text: "Notification"),
      ),
    );
  }
}
