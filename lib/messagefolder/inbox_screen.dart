import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/messagefolder/chat_detailed_screen.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final RxInt selectedIndex = 0.obs; // Observable for tab selection
  final List<String> tabs = ["Unread", "Inbox", "Outbox"];

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundlight,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.white,

          // backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: 0,
          title: _buildTabBar(),
        ),
      ),
      body: Obx(() => IndexedStack(
            index: selectedIndex.value,
            children: [
              _buildChatList(),
              _buildChatList(),
              _buildChatList(),
            ],
          )),
    );
  }

  Widget _buildChatList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: chatList.length,
      itemBuilder: (context, index) {
        final chat = chatList[index];

        return GestureDetector(
          onTap: () {
            Get.to(() => const ChatDetailedScreen());
          },
          child: ListTile(
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
          ),
        );
      },
    );
  }

  Widget _buildTabBar() {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            tabs.length,
            (index) => GestureDetector(
              onTap: () {
                selectedIndex.value = index;
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    tabs[index],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: selectedIndex.value == index ? AppColors.orangebackgroundfortextandbutton : AppColors.pinksahdebackground,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 3,
                    width: 80,
                    color: selectedIndex.value == index ? AppColors.orangebackgroundfortextandbutton : Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
