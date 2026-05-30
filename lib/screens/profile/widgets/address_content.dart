import 'package:flutter/material.dart';

class AddressesContent extends StatelessWidget {
  const AddressesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            offset: const Offset(0, 4),
            blurRadius: 4,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Saved\nAddresses',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight(800)),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text(
                    'Add New\nAddress',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight(800),
                      fontSize: 20,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 9, 53, 247),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fixedSize: const Size(150, 80),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            _buildAddressCard(
              'Home',
              '123 MG Road, Bangalore - 5600001',
              '+91 98765 43210',
              true,
            ),
            const SizedBox(height: 12),
            _buildAddressCard(
              'Work',
              '456 Park Street, Kolkata - 1100002',
              '+91 7305 43280',
              false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressCard(String label, String address,String phone, bool isDefault) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 209, 209, 209)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (isDefault)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(210, 149, 185, 247),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Default',
                        style: TextStyle(color: Color.fromARGB(255, 105, 0, 234), fontSize: 12),
                      ),
                  ),
                ],
              ),
              Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Edit',
                      style: TextStyle(
                        color: Color.fromARGB(255, 33, 58, 243),
                        fontSize: 16
                      ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Delete',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16
                      ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.location_on_outlined, size: 20,),
              SizedBox(width: 8,),
              Expanded(
                child: Text(
                  address, 
                  style: TextStyle(
                    fontSize: 18
                  ),
                )
                )
            ],
          ),
          const SizedBox(height: 12),
                  Row(
            children: [
              Icon(Icons.phone_outlined, size: 20,),
              SizedBox(width: 8,),
              Expanded(
                child: Text(
                  phone, 
                  style: TextStyle(
                    fontSize: 18
                  ),
                )
                )
            ],
          ),
          const SizedBox(height: 12),

        ],
      ),
    );
  }
}