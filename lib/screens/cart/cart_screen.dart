import 'package:ecom/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          color: AppTheme.bg,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shopping Cart",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight(900)
                  ),
                ),
                SizedBox(height: 24,),
                Container(
                  padding: EdgeInsets.all(24),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 110,
                            height: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14)
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              'assets/images/product1.jpg',
                              fit: BoxFit.cover, 
                            ),
                          ),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Brake Pads Set\n(Front)',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight(800),
                                color: Colors.black
                              ),
                              ),
                              Text('Audi A4'),
                              Text('Condition: Like New'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              
                            ),
                          ),
                          Text("₹ 1200")
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}