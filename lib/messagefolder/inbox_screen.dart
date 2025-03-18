import 'package:flutter/material.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> chatList = [
    {
      "name": "Kiayakia",
      "age": 43,
      "location": "Mueang Nonthaburi",
      "message": "I'm Kia, nice to meet you",
      "time": "11 minutes ago",
      "image": "assets/images/girloneimage.jpg",
    },
    {
      "name": "Nutnit55",
      "age": 28,
      "location": "Pattaya",
      "message": "😏💦",
      "time": "5 hours ago",
      "image": "assets/images/girltwo.jpg",
    },
    {
      "name": "Momoo2529999999",
      "age": 35,
      "location": "Pattaya",
      "message": "Hi baby, how are you? Are u in Pattaya?",
      "time": "6 hours ago",
      "image": "assets/images/girlthree.jpg",
    },
    {
      "name": "PGY6979",
      "age": 24,
      "location": "Pattaya",
      "message": "Hi! How are you 🙂",
      "time": "7 hours ago",
      "image": "assets/images/girlfour.jpg",
    },
    {
      "name": "Cream696969",
      "age": 24,
      "location": "Pattaya",
      "message": "Hii! How are you ❤️",
      "time": "7 hours ago",
      "image": "assets/images/girloneimage.jpg",
    },
    {
      "name": "Bowling876",
      "age": 19,
      "location": "Pattaya",
      "message": "Hello",
      "time": "7 hours ago",
      "image": "assets/images/girloneimage.jpg",
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: 0,
          bottom: TabBar(
            controller: _tabController,
            labelColor: Theme.of(context).colorScheme.onPrimary,
            unselectedLabelColor: Colors.grey,
            indicator: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 4),
              ],
            ),
            tabs: const [
              Tab(text: "   UNREAD    "),
              Tab(text: "   INBOX     "),
              Tab(text: "   OUTBOX    "),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildChatList(),
          _buildChatList(),
          _buildChatList(),
        ],
      ),
    );
  }

  Widget _buildChatList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: chatList.length,
      itemBuilder: (context, index) {
        final chat = chatList[index];

        return ListTile(
          leading: SizedBox(
            height: 80,
            width: 55,
            child: Image.asset(
              chat["image"].toString(),
              fit: BoxFit.cover,
            ),
          ),
          title: AppText(
            text: chat["name"],
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: "${chat["age"]}, ${chat["location"]}",
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w700,
              ),
              AppText(
                text: chat["message"],
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onPrimary,
                overflowtext: TextOverflow.ellipsis,
              ),
            ],
          ),
          trailing: Text(
            chat["time"],
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        );
      },
    );
  }
}
