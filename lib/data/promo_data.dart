import 'package:ecom/models/promo_model.dart';
import 'package:flutter/material.dart';

final List<PromoModel> promoList = [

  PromoModel(
    colors: [
      Color(0xFFFF6A00),
      Color(0xFFE53935),
    ],

    title: "Mega Sale - Up To\n50% Off",

    subtitle: "On all brake systems and\nsuspension parts",
  ),
  PromoModel(
    colors: [
      Color(0xFF0476F8),
      Color(0xFF0A4AA9),
    ],

    title: "Free Shipping on\nOrders Above \n₹5000",
    subtitle: "Limited time offer - Shop now!",
  ),

  

  PromoModel(
    colors: [
      Color.fromARGB(255, 27, 193, 15),
      Color.fromARGB(255, 4, 133, 53),
    ],
    title: "Verified Suppliers\nOnly",
    subtitle: "Quality guaranteed with warranty",
  ),

];