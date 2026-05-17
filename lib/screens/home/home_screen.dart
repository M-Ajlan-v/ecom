import 'package:ecom/screens/home/widgets/category.dart';
import 'package:ecom/screens/home/widgets/fast_products.dart';
import 'package:ecom/screens/home/widgets/promo_card.dart';
import 'package:ecom/screens/home/widgets/promo_slider.dart';
import 'package:ecom/screens/home/widgets/trusted_suppliers.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( 
       // ← Enables full screen scrolling
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

          ],
        ),
    );
  }
}