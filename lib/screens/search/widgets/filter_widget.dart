import 'package:ecom/data/product_data.dart';
import 'package:flutter/material.dart';

class FilterContainer extends StatelessWidget {
  final String selectedBrand;
  final String selectedCategory;
  final String selectedCondition;
  final double selectedPrice;

  final Function(String) onBrandChanged;
  final Function(String) onCategoryChanged;
  final Function(String) onConditionChanged;
  final Function(double) onPriceChanged;

  final VoidCallback onReset;

  const FilterContainer({
    super.key,
    required this.selectedBrand,
    required this.selectedCategory,
    required this.selectedCondition,
    required this.selectedPrice,
    required this.onBrandChanged,
    required this.onCategoryChanged,
    required this.onConditionChanged,
    required this.onPriceChanged,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> brands = [
      'All Brands',
      ...{
        ...ProductsList.map(
          (e) => e.carName.split(' ').first,
        ),
      },
    ];

    final List<String> categories = [
      'All Categories',
      ...{
        ...ProductsList.map((e) => e.category),
      },
    ];

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Brand",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedBrand,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: brands.map((brand) {
                      return DropdownMenuItem(
                        value: brand,
                        child: Text(brand),
                      );
                    }).toList(),
                    onChanged: (value) {
                      onBrandChanged(value!);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                "Category",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedCategory,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: categories.map((category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (value) {
                      onCategoryChanged(value!);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                "Condition",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              RadioListTile(
                value: "Used",
                groupValue: selectedCondition,
                onChanged: (v) {
                  onConditionChanged(v!);
                },
                title: const Text("Used"),
                contentPadding: EdgeInsets.zero,
              ),
              RadioListTile(
                value: "Refurbished",
                groupValue: selectedCondition,
                onChanged: (v) {
                  onConditionChanged(v!);
                },
                title: const Text("Refurbished"),
                contentPadding: EdgeInsets.zero,
              ),
              RadioListTile(
                value: "Like New",
                groupValue: selectedCondition,
                onChanged: (v) {
                  onConditionChanged(v!);
                },
                title: const Text("Like New"),
                contentPadding: EdgeInsets.zero,
              ),
              RadioListTile(
                value: "All",
                groupValue: selectedCondition,
                onChanged: (v) {
                  onConditionChanged(v!);
                },
                title: const Text("All"),
                contentPadding: EdgeInsets.zero,
              ),
              const SizedBox(height: 28),
              const Text(
                "Price Range",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Slider(
                value: selectedPrice,
                min: 0,
                max: 20000,
                onChanged: (v) {
                  onPriceChanged(v);
                },
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  const Text("₹0"),
                  Text("₹${selectedPrice.toInt()}"),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xfff3f3f3),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: onReset,
                  child: const Text(
                    "Reset Filters",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}