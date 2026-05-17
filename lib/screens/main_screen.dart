import 'package:ecom/screens/cart/cart_screen.dart';
import 'package:ecom/screens/home/home_screen.dart';
import 'package:ecom/screens/orders/orders_screen.dart';
import 'package:ecom/screens/profile/profile_screen.dart';
import 'package:ecom/screens/search/search_screen.dart';
import 'package:ecom/screens/widgets/custom_bottom_navbar.dart';
import 'package:ecom/screens/widgets/home_top_section.dart';
import 'package:ecom/themes/app_theme.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final List<Widget> pages = [
    const HomeScreen(),
    const SearchScreen(),
    const CartScreen(),
    const OrdersScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: SafeArea(
        child: Column(
          children: [
            const HomeTopSection(),
            // Let the page fill remaining space but NOT force constraints
            Expanded(
              child: pages[currentIndex],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}