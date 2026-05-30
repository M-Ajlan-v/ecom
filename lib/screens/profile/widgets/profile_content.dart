import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  flex: 5,
                  child: Text(
                    'Profile\nInformation',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight(800)),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.settings_outlined, size: 16),
                        SizedBox(width: 10),
                        Text(
                          'Edit\nProfile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight(700),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Full Name',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            const Text(
              'Rajesh Kumar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight(700)),
            ),
            const SizedBox(height: 20),
            const Text(
              'Email address',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            const Text(
              'rajesh.kumar@example.com',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight(700)),
            ),
            const SizedBox(height: 20),
            const Text(
              'Phone Number',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            const Text(
              '+91 9876543210',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight(700)),
            ),
            const SizedBox(height: 20),
            const Text(
              'Member Since',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            const Text(
              'January 2024',
              style: TextStyle(
                fontSize: 18, fontWeight: FontWeight(700)
                ),
            ),
            const SizedBox(height: 20),
            const Divider(color: Color.fromARGB(255, 213, 213, 213)),
            const SizedBox(height: 20),
            const Text(
              "Account Statistics",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight(800)),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                children: [
                  Text(
                    '15',
                    style: TextStyle(
                      color: Color.fromARGB(255, 24, 24, 241),
                      fontSize: 30,
                      fontWeight: FontWeight(900),
                    ),
                  ),
                  Text('Total Orders', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF0FDF4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                children: [
                  Text(
                    '12',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 163, 0),
                      fontSize: 30,
                      fontWeight: FontWeight(900),
                    ),
                  ),
                  Text('Wishlist items', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFFAF5FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                children: [
                  Text(
                    '8',
                    style: TextStyle(
                      color: Color.fromARGB(255, 169, 0, 242),
                      fontSize: 30,
                      fontWeight: FontWeight(900),
                    ),
                  ),
                  Text('Reviews Written', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}