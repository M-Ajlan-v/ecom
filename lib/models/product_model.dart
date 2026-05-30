class ProductVariant {
  final int productID;
  final String productName;
  final int variantID;
  final String variantName;
  final String brandName;
  final String categoryName;
  final String thumbnail;
  final double price;
  final double mrp;
  final int variantStock;
  final String productAttributes;
  final int totalRecords;

  ProductVariant({
    required this.productID,
    required this.productName,
    required this.variantID,
    required this.variantName,
    required this.brandName,
    required this.categoryName,
    required this.thumbnail,
    required this.price,
    required this.mrp,
    required this.variantStock,
    required this.productAttributes,
    required this.totalRecords,
  });

  factory ProductVariant.fromJson(Map<String, dynamic> json) {
    return ProductVariant(
      productID: json['productID'] ?? 0,
      productName: json['productName'] ?? '',
      variantID: json['variantID'] ?? 0,
      variantName: json['variantName'] ?? json['productName'] ?? '',
      brandName: json['brandName'] ?? '',
      categoryName: json['categoryName'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      mrp: (json['mrp'] as num?)?.toDouble() ?? 0,
      variantStock: json['variantStock'] ?? 0,
      productAttributes: json['productAttributes'] ?? '{}',
      totalRecords: json['totalRecords'] ?? 0,
    );
  }

  int get discountPercentage {
    if (mrp > price && mrp > 0) {
      return ((mrp - price) / mrp * 100).toInt();
    }
    return 0;
  }

  bool get isHot => variantStock < 10;
  
  String get displayName => variantName.isNotEmpty ? variantName : productName;
}