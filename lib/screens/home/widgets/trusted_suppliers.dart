import 'package:ecom/data/suppliers_name.dart';
import 'package:flutter/material.dart';

class TrustedSuppliers extends StatelessWidget {
  const TrustedSuppliers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.shield_outlined, size: 30, color: Colors.green),
            SizedBox(width: 10),
            Text(
              "Top Trusted Suppliers",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight(900),
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: suppliersList.length,
          itemBuilder: (context, index) {
            final List<Color> colors = [
              const Color.fromARGB(255, 233, 66, 0),
              const Color.fromARGB(255, 244, 11, 89),
              const Color.fromARGB(255, 75, 5, 160)
            ];
            final supplier = suppliersList[index];
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // Left: CircleAvatar
                            CircleAvatar(
                              radius: 32,
                              backgroundColor: Colors.green,
                              child: CircleAvatar(
                                backgroundColor: colors[index % colors.length],
                                radius: 30,
                                child: Text(
                                  supplier.logoText,
                                  style: TextStyle(color: Colors.white, fontSize: 26),
                                ),
                              ),
                            ),
                            SizedBox(width: 14),
                            // Right: Text, trust icon, and location
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          supplier.name,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight(800),
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(width: 4), // Very small gap - nearly touching
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Colors.green,
                                        child: Icon(
                                          Icons.shield_rounded,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 14,
                                        color: Colors.grey,
                                      ),
                                      Text(supplier.location),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height:14 ,),
                        GridView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // 2 items per row
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 14,
                            childAspectRatio: 1.9,
                          ),
                          children: [
                            // Item 1
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFEFCE8),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Rating", style: TextStyle(color: Colors.black54, fontSize: 12),),
                                  Row(
                                    children: [
                                      Icon(Icons.star_rounded, size: 20, color: Colors.orange),
                                      Text("${supplier.rating}", style: TextStyle(fontSize: 18, fontWeight: FontWeight(900)),),
                                    ],
                                  )
                                ]
                              ),
                            ),
                            // Item 2
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEFF6FF),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Orders", style: TextStyle(color: Colors.black54, fontSize: 12),),
                                    Row(
                                      children: [
                                        Text("${supplier.orders}", style: TextStyle(fontSize: 18, fontWeight: FontWeight(900)),),
                                      ],
                                    )
                                  ]
                              ),
                            ),
                            // Item 3
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF0FDF4),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Success Rate", style: TextStyle(color: Colors.black54, fontSize: 12),),
                                    Row(
                                      children: [
                                        Text("${supplier.successRate}%", style: TextStyle(fontSize: 18,color: Colors.green, fontWeight: FontWeight(900)),),
                                      ],
                                    )
                                  ]
                              ),
                            ),
                            // Item 4
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFAF5FF),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Refund Rate", style: TextStyle(color: Colors.black54, fontSize: 12),),
                                    Row(
                                      children: [
                                        Text("${supplier.refundRate}%", style: TextStyle(fontSize: 18, fontWeight: FontWeight(900), color: Colors.deepPurple),),
                                      ],
                                    )
                                  ]
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(12),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.deepOrange,
                          ),
                          child: Center(
                              child: Text(
                                  "View Products",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight(800)
                                  )
                              )
                          )
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            );
          },
        ),
      ],
    );
  }
}