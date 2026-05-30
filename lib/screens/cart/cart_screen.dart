import 'package:ecom/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final  shipping=cartProvider.totalAmount*0.02;
    final total = cartProvider.totalAmount+shipping;

    return Expanded(
      child: SingleChildScrollView(
        child: Container(
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
                if (cartProvider.items.isEmpty)
                  Container(
                      height: MediaQuery.of(context).size.height / 2,
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "Cart is empty",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: const Color.fromARGB(255, 5, 5, 5)),
                      ),
                    ),
                  )
                else
                  Column(
                    children: [
                      for (var item in cartProvider.items)
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(24),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.withOpacity(.2)),
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                boxShadow: [BoxShadow(
                                  offset: Offset(1, 2),
                                  color: Colors.grey.withOpacity(.8),
                                  blurRadius: 4
                                )]
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
                                          item.product.productImage,
                                          fit: BoxFit.cover, 
                                        ),
                                      ),
                                      SizedBox(width: 20,),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.product.productTitle,
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight(800),
                                                color: Colors.black
                                              ),
                                              softWrap: true,
                                            ),
                                            Text(item.product.carName),
                                            Text('Condition: ${item.product.condition}'),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: IconButton(
                                          onPressed: (){cartProvider.removeFromCart(item.product.id);}, 
                                          icon: Icon(Icons.delete_outline, 
                                          color: Colors.red,))
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 12,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: (){
                                                cartProvider.decreaseQuantity(item.product.id);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(6),
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    top: BorderSide(color: Colors.grey),
                                                    left: BorderSide(color: Colors.grey),
                                                    bottom: BorderSide(color: Colors.grey),
                                                  ),
                                                  borderRadius: BorderRadius.only(
                                                    bottomLeft: Radius.circular(12),
                                                    topLeft: Radius.circular(12)
                                                  )
                                                ),
                                                child: Icon(Icons.remove, size: 20,),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 18),
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.grey, width: 1),
                                              ),
                                              child: Text("${item.quantity}"),
                                            ),
                                            GestureDetector(
                                              onTap: (){
                                                cartProvider.increaseQuantity(item.product.id);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(6),
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    top: BorderSide(color: Colors.grey),
                                                    right: BorderSide(color: Colors.grey),
                                                    bottom: BorderSide(color: Colors.grey),
                                                  ),
                                                  borderRadius: BorderRadius.only(
                                                    bottomRight: Radius.circular(12),
                                                    topRight: Radius.circular(12)
                                                  )
                                                ),
                                                child: Icon(Icons.add, size: 20,)
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "₹ ${item.product.price*item.quantity}",
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight(800)
                                        ),
                                        )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 16,)
                          ],
                        ),
                        SizedBox(height: 24,),
                        Container(
                          padding: EdgeInsets.all(24),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(.6),
                                offset: Offset(1, 3),
                                blurRadius: 5
                              )
                            ],
                            borderRadius: BorderRadius.circular(14)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Order Summary",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight(800)
                              ),
                              ),
                              SizedBox(height: 24,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Subtotal (${cartProvider.itemCount} items)",
                                    style: TextStyle(
                                      fontSize: 18
                                    ),
                                  ),
                                  Text('₹${cartProvider.totalAmount}',
                                  style: TextStyle(
                                      fontSize: 18
                                    ),
                                  ),                                  
                                ],
                              ),
                              SizedBox(height: 12,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Shipping",
                                    style: TextStyle(
                                      fontSize: 18
                                    ),
                                  ),
                                  Text('₹${shipping}',
                                  style: TextStyle(
                                      fontSize: 18
                                    ),
                                  ),                                  
                                ],
                              ),
                              SizedBox(height: 12,),
                              Divider(),
                              SizedBox(height: 12,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total", 
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight(800)
                                  ),
                                  ),
                                  Text(
                                    '${total}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight(800)
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 24,),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepOrange,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    'proceed to checkout',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}