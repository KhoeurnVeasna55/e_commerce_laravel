import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_mart/pages/cart_page.dart';
import 'package:online_mart/pages/home_page.dart';
import 'package:online_mart/pages/order_page.dart';
import 'package:online_mart/pages/profile_page.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          CartPage(),
          OrderPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          selectedItemColor: const Color(0xFF22B2E2),
          unselectedItemColor: Colors.grey,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          elevation: 10,
          onTap: onTabTapped,

          selectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
          unselectedLabelStyle:Theme.of(context).textTheme.bodyMedium ,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.house, size: 20),
              activeIcon: Icon(LucideIcons.house, size: 25),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.shoppingCart, size: 20),
              activeIcon: Icon(LucideIcons.shoppingCart, size: 25),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.package, size: 20),
              activeIcon: Icon(LucideIcons.package, size: 25),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.user, size: 20),
              activeIcon: Icon(LucideIcons.user, size: 25),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
