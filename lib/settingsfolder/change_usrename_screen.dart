import 'package:flutter/material.dart';

class ChangeUsernameScreen extends StatelessWidget {
  final TextEditingController _usernameController =
      TextEditingController(text: "JohnHardy89");

  ChangeUsernameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Row(
            children: [
              Icon(Icons.arrow_back, color: Colors.blue),
            ],
          ),
        ),
        title: const Row(
          children: [
            Text("Back",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
            Text(
              "Change Username",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Username",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
