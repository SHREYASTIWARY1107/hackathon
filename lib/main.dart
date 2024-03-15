import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'login.dart';
import 'signup.dart';
import 'dashboard.dart';
import 'spend_history.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Request necessary permissions here
  await requestPermissions();

  runApp(MyApp());
}

Future<void> requestPermissions() async {
  // Request SMS permission
  await Permission.sms.request();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/main': (context) => MainPage(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DashboardButton(
              label: 'This Month Spends',
              value: '\$500', // Replace with actual value
              onPressed: () {
                // Navigate to SpendHistoryPage when button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SpendHistoryPage()),
                );
              },
            ),
            SizedBox(height: 20.0),
            DashboardButton(
              label: 'Credit Score',
              value: '750', // Replace with actual value
              onPressed: () {
                // Implement action for Credit Score button
              },
            ),
            SizedBox(height: 20.0),
            DashboardButton(
              label: 'Offers',
              value: '3', // Replace with actual number of offers
              onPressed: () {
                // Implement action for Offers button
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final String label;
  final String value;
  final Function()? onPressed;

  const DashboardButton({
    required this.label,
    required this.value,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20.0),
          primary: Colors.black.withOpacity(0.5),
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              value,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
