import 'package:flutter/material.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Information'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              // Handle close action (e.g., navigate back)
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Personal Information title
            Text(
              'Personal Information',

            ),
            const SizedBox(height: 16.0),

            // Name Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Name'),
                Text(
                  'Linfsay',

                ),
              ],
            ),
            const Divider(),

            // Age Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Age'),
                Text(
                  '25',

                ),
              ],
            ),
            const Divider(),

            // Email Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Email'),
                Text(
                  'Linfsay@gmail.com',

                ),
              ],
            ),
            const Divider(),

            // Edit Button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Handle Edit functionality
                },
                child: const Text(
                  'Edit',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
