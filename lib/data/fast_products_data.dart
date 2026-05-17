class FastProduct {
  final String productImage;
  final int? discountPercentage;
  final String carName;
  final String productTitle;
  final double rating;
  final int reviewCount;
  final double price;
  final double? mrp; 
  final String condition;
  final int count;

  const FastProduct({
    required this.productImage,
    this.discountPercentage,
    required this.carName,
    required this.productTitle,
    required this.rating,
    required this.reviewCount,
    required this.price,
    this.mrp,  
    required this.condition,
    required this.count,
  });
}

const List<FastProduct> fastProductsList = [
  FastProduct(
    productImage: 'assets/images/product1.jpg',
    discountPercentage: 25,
    carName: 'Audi A4',
    productTitle: 'Brake Pads Set(front)',
    rating: 4.5,
    reviewCount: 38,
    price: 3500,
    mrp: 4200,
    condition: 'Like New',
    count: 5,
  ),
  FastProduct(
    productImage: 'assets/images/product2.jpg',
    discountPercentage: null,
    carName: 'BMW 3 Series',
    productTitle: 'Engine Oil Filter',
    rating: 4.9,
    reviewCount: 56,
    price: 849,
    condition: 'Refurbished',
    count: 3,
  ),
  FastProduct(
    productImage: 'assets/images/product3.jpg',
    discountPercentage: null,
    carName: 'Toyota Fortuner',
    productTitle: 'Front Shock Absorber Pair',
    rating: 4.9,
    reviewCount: 16,
    price: 6800,
    condition: 'Used',
    count: 3,
  ),
];