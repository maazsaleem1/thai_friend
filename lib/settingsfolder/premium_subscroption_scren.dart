import 'package:flutter/material.dart';

class PremiumSubscriptionScreen extends StatelessWidget {
  const PremiumSubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Back'), backgroundColor: Colors.black),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Icon(Icons.toggle_on, size: 100, color: Colors.green),
                  SizedBox(height: 16),
                  Text(
                    'More Profile Options',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Hide your join date, change your username and more.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Rs 2,235.00 / Month. Cancel any time.',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Subscribe', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                backgroundColor: Colors.purpleAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
