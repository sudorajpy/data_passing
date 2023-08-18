import 'package:data_passing/user_data.dart';
import 'package:flutter/material.dart';

class OutputScreen extends StatelessWidget {
  final UserData userData;
  const OutputScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Output Screen'),
      ),
      body: Center(
        child: Text(userData.availbilityDays.where((day) => !day.contains('All Days')).join(', '),),
      ),
    );
  }
}

