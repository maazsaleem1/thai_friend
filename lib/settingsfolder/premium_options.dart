import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PremiumOptionsContent extends StatefulWidget {
  const PremiumOptionsContent({super.key});

  @override
  PremiumOptionsContentState createState() => PremiumOptionsContentState();
}

class PremiumOptionsContentState extends State<PremiumOptionsContent> {
  bool messagePriority = false;
  bool autoMessageLikes = false;
  TextEditingController messageController = TextEditingController(text: "Hi username!");

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with Close Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Close", style: TextStyle(color: Colors.blue, fontSize: 16)),
              ),
              Text("Premium Options", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(width: 48), // To balance layout
            ],
          ),
          SizedBox(height: 10),

          // Features Section
          Text("Features", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(
            "Your messages will appear at the top of recipients' inboxes - ahead of free members' messages. This greatly increases your chance of a reply.",
            style: TextStyle(fontSize: 14),
          ),
          SwitchListTile(
            title: Text("Message Priority"),
            value: messagePriority,
            onChanged: (value) => setState(() => messagePriority = value),
          ),

          Divider(),

          // Privacy Section
          Text("Privacy", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(
            "Privacy options for premium members have moved to the privacy section in the sidebar.",
            style: TextStyle(fontSize: 14),
          ),

          Divider(),

          // Experimental Features Section
          Row(
            children: [
              Text("🧪 Experimental Features", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 5),
          Text("Automatically send a message to people when you like them in browse.", style: TextStyle(fontSize: 14)),
          SwitchListTile(
            title: Text("🤖 Auto message likes"),
            value: autoMessageLikes,
            onChanged: (value) => setState(() => autoMessageLikes = value),
          ),

          // Message Input
          if (autoMessageLikes) ...[
            SizedBox(height: 5),
            Text("The following message will be sent when you like someone:", style: TextStyle(fontSize: 14)),
            SizedBox(height: 5),
            TextField(
              controller: messageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              ),
            ),
            SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}
