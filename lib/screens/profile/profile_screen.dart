import 'package:ecom/screens/orders/orders_screen.dart';
import 'package:ecom/screens/profile/widgets/address_content.dart';
import 'package:ecom/screens/profile/widgets/orders_content.dart';
import 'package:ecom/screens/profile/widgets/profile_content.dart';
import 'package:ecom/screens/profile/widgets/wishlist_content.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> menuItems = [
    {"title": "Profile", "icon": Icons.person_outline},
    {"title": "My Orders", "icon": Icons.inventory_2_outlined},
    {"title": "Addresses", "icon": Icons.location_on_outlined},
    {"title": "Wishlist", "icon": Icons.favorite_border},
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 246, 246, 246),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        offset: const Offset(0, 4),
                        blurRadius: 4,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        const CircleAvatar(radius: 55),
                        const SizedBox(height: 16),
                        const Text("Rajesh Kumar",
                            style: TextStyle(
                                fontWeight: FontWeight(800), fontSize: 21)),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 240, 192, 0),
                              radius: 8,
                              child: Icon(Icons.shield,
                                  color: Colors.white, size: 13),
                            ),
                            const SizedBox(width: 8),
                            const Text("Gold Member"),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ...List.generate(menuItems.length, (index) {
                          bool isSelected = selectedIndex == index;
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: isSelected
                                        ? const Color.fromARGB(255, 9, 53, 247)
                                        : Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        menuItems[index]["icon"] as IconData,
                                        size: 24,
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      const SizedBox(width: 14),
                                      Text(
                                        menuItems[index]["title"] as String,
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 18,
                                          fontWeight: isSelected
                                              ? FontWeight(700)
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                _buildContent(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (selectedIndex) {
      case 0:
        return const ProfileContent();
      case 1:
        return const OrdersContent();
      case 2:
        return const AddressesContent();
      case 3:
        return const WishlistContent();
      default:
        return const ProfileContent();
    }
  }
}