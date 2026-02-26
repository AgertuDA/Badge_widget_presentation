// Imports Flutter’s Material library which provides UI widgets
import 'package:flutter/material.dart';

void main() {
  // Runs the root widget of the app
  runApp(const BadgeDemoApp());
}

// Root widget of the application
// StatelessWidget is used because this widget itself does not change
class BadgeDemoApp extends StatelessWidget {
  const BadgeDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Enables Material 3 design system
      theme: ThemeData(useMaterial3: true),

      // Sets the home screen of the app
      home: const BadgeDemoPage(),
    );
  }
}

// This widget represents the main screen of the app
// It is Stateful because the badge data can change
class BadgeDemoPage extends StatefulWidget {
  const BadgeDemoPage({super.key});

  @override
  State<BadgeDemoPage> createState() => _BadgeDemoPageState();
}
class _BadgeDemoPageState extends State<BadgeDemoPage> {
  // Stores the number of unread messages shown in the badge
  int unreadMessages = 3;

  // Controls whether the badge is visible or hidden
  bool showBadge = true;

  // Stores the color of the badge
  Color badgeColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar displayed at the top of the screen
      appBar: AppBar(title: const Text('Badge Widget Demo'), centerTitle: true),

      // Main content of the screen with padding
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Badge(
                  // The label shows the unread message count
                  label: Text(
                    unreadMessages.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  // Controls whether the badge is visible
                  isLabelVisible: showBadge,

                  // Sets the background color of the badge
                  backgroundColor: badgeColor,

                  // Controls the size of the badge bubble
                  largeSize: 28,

                  // The widget the badge is attached to
                  child: const Icon(
                    Icons.mail,
                    size: 80,
                  ),
                ),
              ),
            ),

            // Displays current unread message count as text
            Text(
              'Unread Messages: $unreadMessages',
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 16),

            // Button to simulate receiving a new message
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Increase unread message count
                  unreadMessages++;

                  // Ensure badge is visible
                  showBadge = true;
                });
              },
              child: const Text('Add Message'),
            ),

            const SizedBox(height: 12),

            // Button to clear all messages
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Reset unread messages
                  unreadMessages = 0;

                  // Hide the badge when there are no messages
                  showBadge = false;
                });
              },
              child: const Text('Clear Messages'),
            ),

            const SizedBox(height: 16),

            // Switch to toggle badge visibility
            SwitchListTile(
              title: const Text('Show / Hide Badge'),
              value: showBadge,
              onChanged: (value) {
                setState(() {
                  // Update badge visibility based on switch
                  showBadge = value;
                });
              },
            ),

            const SizedBox(height: 8),

            // Row of buttons to change badge color
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Sets badge color to red
                IconButton(
                  icon: const Icon(Icons.circle, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      badgeColor = Colors.red;
                    });
                  },
                ),

                // Sets badge color to green
                IconButton(
                  icon: const Icon(Icons.circle, color: Colors.green),
                  onPressed: () {
                    setState(() {
                      badgeColor = Colors.green;
                    });
                  },
                ),

                // Sets badge color to blue
                IconButton(
                  icon: const Icon(Icons.circle, color: Colors.blue),
                  onPressed: () {
                    setState(() {
                      badgeColor = Colors.blue;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
