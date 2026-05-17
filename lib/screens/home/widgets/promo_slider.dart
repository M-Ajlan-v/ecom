import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/data/promo_data.dart';
import 'package:ecom/screens/home/widgets/promo_card.dart';
import 'package:flutter/material.dart';

class PromoSlider extends StatefulWidget {
  const PromoSlider({super.key});

  @override
  State<PromoSlider> createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider> {
  int currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CarouselSlider.builder(
        itemCount: promoList.length,
        options: CarouselOptions(
          height: 300,
          viewportFraction: 1,
          autoPlay: false,
          onPageChanged: (index, reason) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        itemBuilder: (context, index, realIndex) {
          final promo = promoList[index];
          return PromoCard(
            promo: promo,
          );
        },
      ),
    );
  }
}