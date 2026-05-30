import 'package:ecom/data/product_data.dart';
import 'package:ecom/screens/widgets/product_card.dart';
import 'package:flutter/material.dart';

class FastProducts extends StatelessWidget {
  const FastProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final hotProductsList = ProductsList.where((product) => product.isHot).toList();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.local_fire_department_outlined, color: const Color(0xFFFF6A00)),
                const SizedBox(width: 10),
                const Text(
                  "Fast-Moving\nProducts",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight(900),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "View\nAll",
                  style: TextStyle(
                    color: Color(0xFFFF6A00),
                    fontSize: 16,
                    fontWeight: FontWeight(800),
                  ),
                ),
                const SizedBox(width: 16),
                Icon(Icons.arrow_forward_ios_outlined, size: 16, color: const Color(0xFFFF6A00)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
            childAspectRatio: 0.5,
          ),
          itemCount: hotProductsList.length,
          itemBuilder: (context, index) {
            final product = hotProductsList[index];
            return ProductCard(
              product: product,
              showAddToCartButton: false,
              showHotBadge: true,
            );
          },
        ),
      ],
    );
  }
}