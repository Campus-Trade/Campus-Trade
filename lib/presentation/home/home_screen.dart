import 'package:campus_trade/presentation/Upload/UploadScreen.dart';
import 'package:campus_trade/presentation/chat/chat_screen.dart';
import 'package:campus_trade/presentation/chat/widgets/chat_app_bar.dart';
import 'package:campus_trade/presentation/home/widgets/appBar_home.dart';
import 'package:campus_trade/presentation/profile/profile_screen.dart';
import 'package:campus_trade/presentation/profile/widgets/appBar_profile.dart';
import 'package:campus_trade/presentation/resources/color_manager.dart';
import 'package:campus_trade/presentation/home/widgets/card_home.dart';
import 'package:campus_trade/presentation/home/widgets/item_card_list.dart';
import 'package:campus_trade/presentation/home/widgets/item_show_widget.dart';
import 'package:campus_trade/presentation/search/search_screen.dart';
import 'package:campus_trade/presentation/search/widgets/appBar_search.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    const HomeContent(),
    const SearchScreen(),
    const ChatScreen(),
    const ProfileScreen()
  ];
  final List<PreferredSizeWidget> appBar = [
    const AppbarHome(),
    const AppbarSearch(),
    const ChatAppBar(),
    const AppbarProfile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.SecondaryColor,
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return UploadScreen();
          }));
        },
        child: const Icon(
          Icons.add,
          color: ColorManager.PrimaryColor,
        ),
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: ColorManager.SecondaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavBarItem(
              icon: Icons.home,
              isSelected: selectedIndex == 0,
              onTap: () => _onItemTapped(0),
            ),
            _buildNavBarItem(
              icon: Icons.search,
              isSelected: selectedIndex == 1,
              onTap: () => _onItemTapped(1),
            ),
            const SizedBox(width: 30),
            _buildNavBarItem(
              icon: Icons.forum,
              isSelected: selectedIndex == 2,
              onTap: () => _onItemTapped(2),
            ),
            _buildNavBarItem(
              icon: Icons.person,
              isSelected: selectedIndex == 3,
              onTap: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavBarItem({
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return IconButton(
      icon: Icon(
        icon,
        color: isSelected
            ? ColorManager.PrimaryColor
            : const Color.fromARGB(255, 223, 231, 237),
        size: 35,
      ),
      onPressed: onTap,
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CardHome(),
            ItemShowWidget(
              title: 'Nearby Sellers',
              text: 'See All',
            ),
            ItemCardList(),
            ItemShowWidget(
              title: 'Recommends',
              text: 'See All',
            ),
            ItemCardList(),
          ],
        ),
      ),
    );
  }
}
