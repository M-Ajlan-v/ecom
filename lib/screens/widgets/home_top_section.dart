// widgets/home_top_section.dart

import 'package:ecom/themes/app_theme.dart';
import 'package:flutter/material.dart';

class HomeTopSection extends StatelessWidget {
  const HomeTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),

      decoration: BoxDecoration(
        color: AppTheme.white,
        border: Border(
          bottom: BorderSide(
            color: AppTheme.border,
          ),
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // logo
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppTheme.primary,
              borderRadius: BorderRadius.circular(12),
            ),

            child: const Icon(
              Icons.inventory_2_outlined,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 14),

          TextField(
            decoration: InputDecoration(
              hintText: "Search car parts...",
              prefixIcon: const Icon(
                Icons.search,
                color: AppTheme.textSecondary,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppTheme.border,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  width: 3,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}