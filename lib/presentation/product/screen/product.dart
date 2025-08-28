import 'package:flutter/material.dart';
import '../../cart/cart.dart';
import '../widget/product_details.dart';

class ProductScreen extends StatelessWidget {
  final String image;
  final String title;
  final String price;

  const ProductScreen({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),

          // Back button
          Positioned(
            top: 50,
            left: 20,
            child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.4),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),

          // Favorite and Cart buttons
          Positioned(
            top: 50,
            right: 20,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.4),
                  child: IconButton(
                    icon: const Icon(Icons.favorite_border,
                        color: Colors.black),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.4),
                  child: IconButton(
                    icon: const Icon(Icons.shopping_bag_outlined,
                        color: Colors.black),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Details section extracted into widget
          Align(
            alignment: Alignment.bottomCenter,
            child: ProductDetails(
              title: title,
              price: price,
            ),
          ),
        ],
      ),
    );
  }
}
