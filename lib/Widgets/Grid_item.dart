import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/CartModel.dart';
import '../Provider/CartProvider.dart';
import '../Screens/Iteam_screen.dart';

class GridItem extends StatelessWidget {
  const GridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pName = [
      "Apple Watch -M2",
      "White Tshirt",
      "Nike Shoe",
      "Ear Headphone",
      "Apple Watch -M2",
      "White Tshirt",
      "Nike Shoe",
      "Ear Headphone",
      "Apple Watch -M2",
      "White Tshirt",
      "Nike Shoe",
      "Ear Headphone",
    ];

    return GridView.builder(
      itemCount: pName.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.7,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xFFD4ECF7),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Text(
                        "30% OFF",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: context
                            .watch<CartProvider>()
                            .cartItems
                            .any((item) => item.name == pName[index])
                            ? Colors.red
                            : Colors.grey,
                      ),
                      onPressed: () {
                        final cartProvider = context.read<CartProvider>();
                        final item = CartItem(
                          name: pName[index],
                          price: 100.0, // Set the price as needed
                          imageUrl: "images/${pName[index]}.png",
                        );
                        if (!cartProvider.cartItems.contains(item)) {
                          cartProvider.addItemToCart(item);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Item added to the cart'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Item is already in the cart'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IteamScreen()),
                      );
                    },
                    child: Image.asset(
                      "images/${pName[index]}.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pName[index],
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Row(
                        children: [
                          Text(
                            "\$100",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
