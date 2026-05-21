import 'package:ecom/data/product_data.dart';
import 'package:ecom/screens/search/widgets/filter_widget.dart';
import 'package:ecom/screens/widgets/product_card.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isExpanded = false;

  String selectedSortOption = 'popularity';

  String selectedBrand = 'All Brands';
  String selectedCategory = 'All Categories';
  String selectedCondition = 'All';

  double selectedPrice = 20000;

  void filter() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  List<Product> getFilteredAndSortedProducts() {
    List<Product> filteredProducts =
        fastProductsList.where((product) {
      final brandMatch =
          selectedBrand == 'All Brands' ||
              product.carName.split(' ').first ==
                  selectedBrand;

      final categoryMatch =
          selectedCategory == 'All Categories' ||
              product.category == selectedCategory;

      final conditionMatch =
          selectedCondition == 'All' ||
              product.condition == selectedCondition;

      final priceMatch =
          product.price <= selectedPrice;

      return brandMatch &&
          categoryMatch &&
          conditionMatch &&
          priceMatch;
    }).toList();

    switch (selectedSortOption) {
      case 'price_low_high':
        filteredProducts.sort(
          (a, b) => a.price.compareTo(b.price),
        );
        break;

      case 'price_high_low':
        filteredProducts.sort(
          (a, b) => b.price.compareTo(a.price),
        );
        break;

      case 'rating':
        filteredProducts.sort(
          (a, b) => b.rating.compareTo(a.rating),
        );
        break;

      case 'popularity':
      default:
        filteredProducts.sort(
          (a, b) =>
              b.reviewCount.compareTo(a.reviewCount),
        );
    }

    return filteredProducts;
  }

  @override
  Widget build(BuildContext context) {
    final displayedProducts =
        getFilteredAndSortedProducts();

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        color: const Color.fromARGB(
          227,
          249,
          249,
          252,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              const Text(
                "Product Catalog",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Browse our extensive collection of quality car parts",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: filter,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.filter_alt_outlined,
                        size: 26,
                      ),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Text(
                          "Filters",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight:
                                FontWeight.w700,
                          ),
                        ),
                      ),
                      Icon(
                        isExpanded
                            ? Icons
                                .keyboard_arrow_up
                            : Icons
                                .keyboard_arrow_down,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (isExpanded)
                FilterContainer(
                  selectedBrand:
                      selectedBrand,
                  selectedCategory:
                      selectedCategory,
                  selectedCondition:
                      selectedCondition,
                  selectedPrice:
                      selectedPrice,
                  onBrandChanged:
                      (value) {
                    setState(() {
                      selectedBrand =
                          value;
                    });
                  },
                  onCategoryChanged:
                      (value) {
                    setState(() {
                      selectedCategory =
                          value;
                    });
                  },
                  onConditionChanged:
                      (value) {
                    setState(() {
                      selectedCondition =
                          value;
                    });
                  },
                  onPriceChanged:
                      (value) {
                    setState(() {
                      selectedPrice =
                          value;
                    });
                  },
                  onReset: () {
                    setState(() {
                      selectedBrand =
                          'All Brands';

                      selectedCategory =
                          'All Categories';

                      selectedCondition =
                          'All';

                      selectedPrice =
                          20000;
                    });
                  },
                ),
              const SizedBox(height: 30),
              Container(
                padding:
                    const EdgeInsets.all(18),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Showing ${displayedProducts.length} Products",
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text(
                          "Sort by:",
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Container(
                            padding:
                                const EdgeInsets
                                    .symmetric(
                              horizontal: 16,
                            ),
                            decoration:
                                BoxDecoration(
                              border: Border.all(
                                color: Colors
                                    .grey
                                    .shade300,
                              ),
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                14,
                              ),
                            ),
                            child:
                                DropdownButtonHideUnderline(
                              child:
                                  DropdownButton<
                                      String>(
                                value:
                                    selectedSortOption,
                                isExpanded:
                                    true,
                                icon:
                                    const Icon(
                                  Icons
                                      .keyboard_arrow_down,
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value:
                                        'popularity',
                                    child: Text(
                                      'Popularity',
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value:
                                        'price_low_high',
                                    child: Text(
                                      'Price: Low to High',
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value:
                                        'price_high_low',
                                    child: Text(
                                      'Price: High to Low',
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value:
                                        'rating',
                                    child: Text(
                                      'Rating',
                                    ),
                                  ),
                                ],
                                onChanged:
                                    (value) {
                                  setState(() {
                                    selectedSortOption =
                                        value!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(),
                itemCount:
                    displayedProducts.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.43,
                ),
                itemBuilder:
                    (context, index) {
                  return ProductCard(
                    product:
                        displayedProducts[
                            index],
                    showAddToCartButton:
                        true,
                    showHotBadge: true,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}