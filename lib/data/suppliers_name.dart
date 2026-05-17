class Supplier {

  final String name;
  final String location;
  final String logoText;

  final double rating;
  final int orders;

  final int successRate;
  final double refundRate;

  Supplier({
    required this.name,
    required this.location,
    required this.logoText,
    required this.rating,
    required this.orders,
    required this.successRate,
    required this.refundRate,
  });
}

List<Supplier> suppliersList = [

  Supplier(
    name: "AutoParts Pro",
    location: "Mumbai, Maharashtra",
    logoText: "AP",
    rating: 4.8,
    orders: 1523,
    successRate: 98,
    refundRate: 1.2,
  ),

  Supplier(
    name: "Premium Motors Supply",
    location: "Delhi, NCR",
    logoText: "PM",
    rating: 4.9,
    orders: 2341,
    successRate: 99,
    refundRate: 0.8,
  ),

  Supplier(
    name: "Euro Parts Hub",
    location: "Bangalore, Karnataka",
    logoText: "EP",
    rating: 4.7,
    orders: 987,
    successRate: 97,
    refundRate: 1.5,
  ),
];