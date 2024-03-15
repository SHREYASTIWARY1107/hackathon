import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dashboard.dart'; // Import your dashboard page here

class LoginPage extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Call requestSmsPermission here
    requestSmsPermission(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.blue, // Adjust app bar color
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/login_logo.png', // Add your logo here
              height: 100, // Adjust logo size
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                prefixIcon: Icon(Icons.phone), // Add phone icon
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock), // Add lock icon
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Adjust button color
              ),
            ),
            SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                // Navigate to sign up page
                Navigator.pushNamed(context, '/signup');
              },
              child: Text(
                'New user? Sign up here',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to request SMS permission
  void requestSmsPermission(BuildContext context) async {
    final PermissionStatus status = await Permission.sms.request();
    if (!status.isGranted) {
      // Permission denied, handle accordingly
      print('SMS permission is required for certain features.');
    }
  }
}
