import 'package:ecom/screens/home/widgets/category.dart';
import 'package:ecom/screens/home/widgets/fast_products.dart';
import 'package:ecom/screens/home/widgets/promo_card.dart';
import 'package:ecom/screens/home/widgets/promo_slider.dart';
import 'package:ecom/screens/home/widgets/recommended_prodfuct.dart';
import 'package:ecom/screens/home/widgets/trusted_suppliers.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        left: 20,
        right: 25,
        top: 25,
      ),
      child: Column(
        children: [
          const PromoSlider(),
          const SizedBox(height: 24),
          const Category(),
          const SizedBox(height: 34),
          const FastProducts(),
          const SizedBox(height: 34),
          const TrustedSuppliers(),
          const SizedBox(height: 34),
          const RecommendedForYou(),
          const SizedBox(height: 34),
          
          Container(
            padding: const EdgeInsets.all(26),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 57, 214, 65),
                  Color.fromARGB(255, 41, 175, 50),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromARGB(195, 71, 167, 75),
                  child: Icon(Icons.shield_outlined, size: 40, color: Colors.white),
                ),
                const Text(
                  "Verified Suppliers",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),
                ),
                Text(
                  "All suppliers verified and rated by real customers",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          
          Container(
            padding: const EdgeInsets.all(26),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue,
                  Color.fromARGB(255, 45, 104, 192),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromARGB(195, 66, 165, 245),
                  child: Icon(Icons.star_outline_rounded, size: 40, color: Colors.white),
                ),
                const Text(
                  "Quality Guarantee",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),
                ),
                Text(
                  "Every part comes with warranty and quality assurance",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          
          Container(
            padding: const EdgeInsets.all(26),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.deepOrange,
                  Color.fromARGB(255, 237, 80, 32),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromARGB(195, 255, 112, 67),
                  child: Icon(Icons.access_time, size: 35, color: Colors.white),
                ),
                const Text(
                  "Fast Delivery",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),
                ),
                Text(
                  "Quick delivery with real-time tracking for all orders",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 34),
        ],
      ),
    );
  }
}