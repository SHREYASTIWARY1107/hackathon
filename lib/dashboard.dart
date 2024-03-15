import 'package:brahmanapp/spend_history.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EXPENSE TRACKER'),
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: DashboardButton(
                      label: 'This Month Spends',
                      value: '\$500',
                      icon: Icons.attach_money,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SpendHistoryPage()),
                        );
                        // Implement action for This Month Spends button
                      },
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: DashboardButton(
                      label: 'Credit Score',
                      value: '750',
                      icon: Icons.score,
                      onPressed: () {
                        // Implement action for Credit Score button
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: DashboardButton(
                      label: 'Offers',
                      value: '3',
                      icon: Icons.local_offer,
                      onPressed: () {
                        // Implement action for Offers button
                      },
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: DashboardButton(
                      label: 'Another Button',
                      value: 'Value',
                      icon: Icons.star,
                      onPressed: () {
                        // Implement action for another button
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: 40.0), // Add space between buttons and the new button
              ElevatedButton(
                onPressed: () {
                  // Implement action for splitting bills with friends
                },
                child: Text(
                  'Split your Bills with your friends',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Set button color to green
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Function()? onPressed;

  const DashboardButton({
    required this.label,
    required this.value,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: 120.0,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
                color: Colors.white,
              ),
              SizedBox(height: 10.0),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                value,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DashboardPage(),
  ));
}
