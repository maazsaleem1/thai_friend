import 'package:flutter/material.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "Close",
            style: TextStyle(color: Colors.blue, fontSize: 12),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Would you like a fresh start?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            // Reset Options
            _buildResetOption("✅", "Keep your profile information"),
            _buildResetOption("✅", "Keep your photos, verified status"),
            _buildResetOption("❌", "Delete all messages sent & received"),
            _buildResetOption("❌", "Remove likes, hides, favorites, notes"),
            _buildResetOption("🌸", "Look like a completely new account"),

            const Spacer(),

            // Reset Account Button
            ElevatedButton(
              onPressed: () {
                // Add reset logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "Reset Account",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),

            // Disclaimer
            const Text(
              "This action cannot be reversed.",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),

            // Delete Account Option
            TextButton(
              onPressed: () {
                // Add delete account logic here
              },
              child: const Text(
                "No thanks, just delete my account",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget for Reset Options
  Widget _buildResetOption(String icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(icon, style: TextStyle(fontSize: 22)),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
