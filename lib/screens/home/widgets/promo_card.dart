import 'package:ecom/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:ecom/models/promo_model.dart';

class PromoCard extends StatelessWidget {
    final PromoModel promo;

   const PromoCard({
    super.key,
    required this.promo,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(24),
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: promo.colors,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            promo.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              height: 1.2
            )
          ),
          const SizedBox(height: 14),
          Text(
            promo.subtitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight(500)
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              "Shop Now",
              style: TextStyle(
                fontWeight: FontWeight(700),
                fontSize: 18,
                color: AppTheme.primaryRed
              ),
            ),
          ),
        ],
      ),
    );
  }
}