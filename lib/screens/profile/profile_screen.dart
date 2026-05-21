import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> menuItems = [
    {"title": "Profile", "icon": Icons.person_outline},
    {"title": "My Orders", "icon": Icons.inventory_2_outlined},
    {"title": "Addresses", "icon": Icons.location_on_outlined},
    {"title": "Wishlist", "icon": Icons.favorite_border},
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 246, 246, 246),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            offset: const Offset(0, 4),
                            blurRadius: 4)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        CircleAvatar(radius: 55),
                        SizedBox(height: 16),
                        Text("Rajesh Kumar",
                            style: TextStyle(
                                fontWeight: FontWeight(800), fontSize: 21)),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color.fromARGB(255, 240, 192, 0),
                              radius: 8,
                              child:
                                  Icon(Icons.shield, color: Colors.white, size: 13),
                            ),
                            SizedBox(width: 8),
                            Text("Gold Member"),
                          ],
                        ),
                        SizedBox(height: 16),
                        ...List.generate(menuItems.length, (index) {
                          bool isSelected = selectedIndex == index;
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: isSelected
                                        ? const Color.fromARGB(255, 9, 53, 247)
                                        : Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        menuItems[index]["icon"] as IconData,
                                        size: 24,
                                        color: isSelected ? Colors.white : Colors.black,
                                      ),
                                      SizedBox(width: 14),
                                      Text(
                                        menuItems[index]["title"] as String,
                                        style: TextStyle(
                                          color:
                                              isSelected ? Colors.white : Colors.black,
                                          fontSize: 18,
                                          fontWeight: isSelected
                                              ? FontWeight(700)
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            offset: const Offset(0, 4),
                            blurRadius: 4)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
          
                            Expanded(
                              flex: 5,
                              child: Text('Profile\nInformation', 
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight(800)
                              ),),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.black)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.settings_outlined,size: 16,),
                                    SizedBox(width: 10,),
                                    Text('Edit\nProfile', 
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight(700),
                                      fontSize: 16
                                    ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text('Full Name', style: TextStyle(
                          fontSize: 14
                        ),
                        ),
                        SizedBox(height: 8),
                        Text('Rajesh Kumar',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight(700)
                        ),
                        ),
                        SizedBox(height: 20,),
                          Text('Email address', style: TextStyle(
                          fontSize: 14
                        ),
                        ),
                        SizedBox(height: 8),
                        Text('rajesh.kumar@example.com',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight(700)
                        ),
                        ),
                        SizedBox(height: 20,),
                        Text('Phone Number', style: TextStyle(
                          fontSize: 14
                        ),
                        ),
                        SizedBox(height: 8),
                        Text('+91 9876543210',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight(700)
                        ),
                        ),
                        SizedBox(height: 20,),
                          Text('Member Since', style: TextStyle(
                          fontSize: 14
                        ),
                        ),
                        SizedBox(height: 8),
                        Text('January 2024',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight(700)
                        ),
                        ),
                        SizedBox(height: 20,),
                        Divider(color: const Color.fromARGB(255, 213, 213, 213),),
                        SizedBox(height: 20,),
                        Text("Account Statistics",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight(800), 
                        ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          padding: EdgeInsets.all(16),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF6FF),
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Column(
                            children: [
                              Text(
                                '15',
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 24, 24, 241),
                                  fontSize: 30,
                                  fontWeight: FontWeight(900)
                                ),
                              ),
                              Text('Total Orders',style: TextStyle(fontSize: 14),)
                            ],
                          ),
                        ),
                        SizedBox(height: 12,),
                        Container(
                          padding: EdgeInsets.all(16),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0FDF4),
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Column(
                            children: [
                              Text(
                                '12',
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 163, 0),
                                  fontSize: 30,
                                  fontWeight: FontWeight(900)
                                ),
                              ),
                              Text('Wishlist items',style: TextStyle(fontSize: 14),)
                            ],
                          ),
                        ),
                        SizedBox(height: 12,),
                        Container(
                          padding: EdgeInsets.all(16),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFAF5FF),
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Column(
                            children: [
                              Text(
                                '8',
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 169, 0, 242),
                                  fontSize: 30,
                                  fontWeight: FontWeight(900)
                                ),
                              ),
                              Text('Reviews Written',style: TextStyle(fontSize: 14),)
                            ],
                          ),
                        ),
                        SizedBox(height: 12,),
                        
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}