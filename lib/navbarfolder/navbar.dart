import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/EnterAppScreens/search_screens.dart';

class NavBarFamily extends StatefulWidget {
  const NavBarFamily({super.key});

  @override
  State<NavBarFamily> createState() => _NavBarFamilyState();
}

class _NavBarFamilyState extends State<NavBarFamily> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int selectedIndex = 0;
  RxInt count = 0.obs;
  // final bottomController = Get.put(FamilyNavBarController());

  @override
  Widget build(BuildContext context) {
    var screens = [
      const SearchScreens(),
      // const HomeScreenFamily(),
      // const MyBookingScreenFamily(),
      // const WalletScreenCareTaker(),
      // const ChatScreenFamily(),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: false,
      key: _key,
      // drawer: const CustomDrawerFamily(),
      // appBar: getAppBar(bottomController.count.value),

      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
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
      body: screens[count.value],
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isActive = index == selectedIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 32,
            color: isActive ? Colors.blue : Colors.white,
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 3,
              width: 24,
              color: Colors.blue,
            ),
        ],
      ),
    );
  }
}


// //   AppBar getAppBar(int index) {
// //     String title;
// //     switch (index) {
// //       case 0:
// //         title = 'Home';
// //         break;
// //       case 1:
// //         title = 'Bookings';
// //         break;
// //       case 2:
// //         title = 'Wallet';
// //         break;
// //       case 3:
// //         title = 'Chat';
// //         break;
// //       default:
// //         title = '';
// //     }

// //     return AppBar(
// //       surfaceTintColor: Appcolors.whitecolortext,
// //       elevation: 0,
// //       backgroundColor: Appcolors.whitecolortext,
// //       leading: GestureDetector(
// //         onTap: () => _key.currentState!.openDrawer(),
// //         child: Padding(
// //           padding: EdgeInsets.only(left: 15.w),
// //           child: SvgPicture.asset(
// //             "assets/images/drawericon.svg",
// //             height: 40,
// //           ),
// //         ),
// //       ),
// //       title: Text(title, style: interFont(fontsize: 18, fontweight: FontWeight.w600, color: Appcolors.textsecondary)),
// //       centerTitle: true,
// //       actions: [
// //         Padding(
// //           padding: EdgeInsets.only(right: 15.w),
// //           child: Row(
// //             children: [
// //               GestureDetector(
// //                 onTap: () {
// //                   Get.to(() => const NotificationScreen());
// //                 },
// //                 child: badges.Badge(
// //                   badgeContent: const Text(
// //                     "3",
// //                     style: TextStyle(color: Colors.white, fontSize: 10),
// //                   ),
// //                   position: badges.BadgePosition.topEnd(top: -5, end: 0),
// //                   child: SvgPicture.asset(
// //                     "assets/images/notificationicon.svg",
// //                     height: 35.h,
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         )
// //       ],
// //     );
// //   }
// // }

// // Widget bottomNavbar(FamilyNavBarController bottomcontroller) {
// //   return Container(
// //     height: 88.h,
// //     width: 1.sw,
// //     color: Appcolors.textfieldcolour,
// //     child: Obx(() {
// //       return Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //         children: [
// //           navBarItem(
// //             index: 0,
// //             controller: bottomcontroller,
// //             selectedIcon: "assets/images/selectedhomeiconnavbar.svg",
// //             unselectedIcon: "assets/images/unselectedhomeiconnavbar.svg",
// //             label: "Home",
// //           ),
// //           navBarItem(
// //             index: 1,
// //             controller: bottomcontroller,
// //             selectedIcon: "assets/images/selectedbookingiconnavbar.svg",
// //             unselectedIcon: "assets/images/unseelctedbookingiconnavbar.svg",
// //             label: "My Bookings",
// //           ),
// //           navBarItem(
// //             index: 2,
// //             controller: bottomcontroller,
// //             selectedIcon: "assets/images/selectedwalleticonnavbar.svg",
// //             unselectedIcon: "assets/images/unselectedwalleticonnavbar.svg",
// //             label: "My Wallet",
// //           ),
// //           navBarItem(
// //             index: 3,
// //             controller: bottomcontroller,
// //             selectedIcon: "assets/images/selectedchaticonnavbar.svg",
// //             unselectedIcon: "assets/images/unselectediconchatnavbar.svg",
// //             label: "Chat",
// //           ),
// //         ],
// //       );
// //     }),
// //   );
// // }

// // Widget navBarItem({
// //   required int index,
// //   required FamilyNavBarController controller,
// //   required String selectedIcon,
// //   required String unselectedIcon,
// //   required String label,
// // }) {
// //   bool isSelected = controller.count.value == index;

// //   return GestureDetector(
// //     onTap: () {
// //       controller.itemSelect(index);
// //     },
// //     child: Column(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children: [
// //         SvgPicture.asset(isSelected ? selectedIcon : unselectedIcon),
// //         SizedBox(height: isSelected ? 5.h : 5.h),
// //         AppText(
// //           text: label,
// //           fontSize: 10.sp,
// //           fontWeight: FontWeight.w500,
// //           color: Appcolors.textsecondary,
// //         ),
// //       ],
// //     ),
// //   );
// // }


// import 'package:flutter/material.dart';

// class CustomNavBar extends StatefulWidget {
//   @override
//   _CustomNavBarState createState() => _CustomNavBarState();
// }

// class _CustomNavBarState extends State<CustomNavBar> {
//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.pink,
//       body: Center(
//         child: Text(
//           'Selected Tab: $selectedIndex',
//           style: const TextStyle(color: Colors.white),
//         ),
//       ),
    //   bottomNavigationBar: BottomAppBar(
    //     color: Colors.black,
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: [
    //         _buildNavItem(Icons.search, 0),
    //         _buildNavItem(Icons.bolt, 1),
    //         _buildNavItem(Icons.email, 2),
    //         _buildNavItem(Icons.grid_view, 3),
    //         _buildNavItem(Icons.person, 4),
    //       ],
    //     ),
    //   ),
    // );
//   }

//  
