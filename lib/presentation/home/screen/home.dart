import 'package:flutter/material.dart';
import '../../product/screen/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // number of tabs
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Welcome Back!",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0XFF4F5663),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Falcon Thought",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: const Icon(Icons.lock_outline, size: 20),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 230, 230, 230),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.search,
                          size: 24, color: Color.fromARGB(255, 115, 115, 115)),
                      SizedBox(width: 8),
                      Text(
                        "What are you looking for...",
                        style: TextStyle(
                          color: Color(0xFF9E9E9E),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Offer Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 230, 230, 230),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text part
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Shop with us!",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Get 40% Off for\nall items",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  "Shop Now",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Icon(Icons.arrow_forward, size: 16),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 10),

                      // Image part
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: SizedBox(
                          height: 120,
                          width: 90,
                          child: Image.asset(
                            "images/man.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // TabBar
              const TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.black,
                tabs: [
                  Tab(text: "All"),
                  Tab(text: "Jackets"),
                  Tab(text: "Jeans"),
                  Tab(text: "Shoes"),
                ],
              ),

              // Tab content
              Expanded(
                child: TabBarView(
                  children: [
                    // ALL Products Grid
                    GridView.count(
                      crossAxisCount: 2,
                      padding: const EdgeInsets.all(12),
                      childAspectRatio: 0.65,
                      children: const [
                        ProductCard(
                          image: "images/jacket.jpg",
                          title: "Bomber Jacket",
                          price: "\$49.99",
                        ),
                        ProductCard(
                          image: "images/model.jpg",
                          title: "Denim Jacket",
                          price: "\$59.99",
                        ),
                        ProductCard(
                          image: "images/Product.png",
                          title: "Leather Jacket",
                          price: "\$79.99",
                        ),
                        ProductCard(
                          image: "images/jacket.jpg",
                          title: "Casual Jacket",
                          price: "\$39.99",
                        ),
                      ],
                    ),

                    // Jackets tab
                    Center(child: Text("Jackets")),

                    // Jeans tab
                    Center(child: Text("Jeans")),

                    // Shoes tab
                    Center(child: Text("Shoes")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;

  const ProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to product screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(
              image: image,
              title: title,
              price: price,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  // Product Image
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),

                  // Like button (top right corner)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(192, 255, 255, 255),
                      child: IconButton(
                        icon: const Icon(Icons.favorite_border, color: Colors.black),
                        onPressed: () {
                          // Handle like
                        },
                      ),
                    ),
                  ),

                  // Shopping cart button (bottom center)
                  Positioned(
                    bottom: 8,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: IconButton(
                          icon: const Icon(Icons.shopping_bag, color: Colors.white),
                          onPressed: () {
                            // Handle add to cart
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(price, style: const TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}

// Example ProductScreen (dummy)
class ProductScreen extends StatelessWidget {
  final String image;
  final String title;
  final String price;

  const ProductScreen(
      {Key? key, required this.image, required this.title, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          children: [
            Image.asset(image),
            Text(title),
            Text(price),
          ],
        ),
      ),
    );
  }
}
