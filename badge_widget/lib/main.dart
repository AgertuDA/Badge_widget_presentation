import 'package:flutter/material.dart';

void main() {
  runApp(const BadgeDemoApp());
}

class BadgeDemoApp extends StatelessWidget {
  const BadgeDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const BadgeDemoPage(),
    );
  }
}

class BadgeDemoPage extends StatefulWidget {
  const BadgeDemoPage({super.key});

  @override
  State<BadgeDemoPage> createState() => _BadgeDemoPageState();
}

class _BadgeDemoPageState extends State<BadgeDemoPage> {
  int unreadMessages = 3;
  bool showBadge = true;
  Color badgeColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Badge Widget Demo'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // CENTERED BIG MAIL + BADGE
            Expanded(
              child: Center(
                child: Badge(
                  label: Text(
                    unreadMessages.toString(),
                    style: const TextStyle(
                      fontSize: 20, // big number
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  isLabelVisible: showBadge,
                  backgroundColor: badgeColor,
                  largeSize: 28, // big badge bubble
                  child: const Icon(
                    Icons.mail,
                    size: 80, // big mail icon
                  ),
                ),
              ),
            ),

            // CONTROLS SECTION
            Text(
              'Unread Messages: $unreadMessages',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  unreadMessages++;
                  showBadge = true;
                });
              },
              child: const Text('Add Message'),
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  unreadMessages = 0;
                  showBadge = false;
                });
              },
              child: const Text('Clear Messages'),
            ),

            const SizedBox(height: 16),

            SwitchListTile(
              title: const Text('Show / Hide Badge'),
              value: showBadge,
              onChanged: (value) {
                setState(() {
                  showBadge = value;
                });
              },
            ),

            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.circle, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      badgeColor = Colors.red;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.circle, color: Colors.green),
                  onPressed: () {
                    setState(() {
                      badgeColor = Colors.green;
                    });
                  },
                ),
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
