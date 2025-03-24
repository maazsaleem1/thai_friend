import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/EnterAppScreens/search_screens.dart';
import 'package:thai_friendly_app/allusercardswiperscreen/user_right_left_screen.dart';
import 'package:thai_friendly_app/menunavbarscreen/all_the_selected_user.dart';
import 'package:thai_friendly_app/messagefolder/inbox_screen.dart';
import 'package:thai_friendly_app/profilefolder/profile_view.dart';

class NavBarFamily extends StatefulWidget {
  const NavBarFamily({super.key});

  @override
  State<NavBarFamily> createState() => _NavBarFamilyState();
}

class _NavBarFamilyState extends State<NavBarFamily> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  RxInt count = 0.obs;

  @override
  Widget build(BuildContext context) {
    var screens = [
      const SearchScreens(),
      const AllUserCardSwiperScreen(),
      const ChatScreen(),
      const SelectedUsersShowsHereScreen(),
      const ProfileViewScreens(),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      key: _key,
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).appBarTheme.backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.search, 0),
            _buildNavItem(Icons.bolt, 1),
            _buildNavItem(Icons.email, 2),
            _buildNavItem(Icons.grid_view, 3),
            _buildNavItem(Icons.person, 4),
          ],
        ),
      ),
      body: Obx(() => screens[count.value]), // Reactive UI update
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        count.value = index; // Updating GetX state
      },
      child: Obx(() {
        bool isActive = index == count.value;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 32,
              color: isActive ? Colors.blue : Theme.of(context).iconTheme.color,
            ),
            if (isActive)
              Container(
                margin: const EdgeInsets.only(top: 4),
                height: 3,
                width: 24,
                color: Colors.blue,
              ),
          ],
        );
      }),
    );
  }
}
