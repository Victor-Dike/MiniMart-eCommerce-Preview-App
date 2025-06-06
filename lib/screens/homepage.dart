import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:minimart_ecommerce_preview_app/component/product_tile.dart';
// import 'package:minimart_ecommerce_preview_app/models/product.dart';
import 'package:minimart_ecommerce_preview_app/models/shop.dart';
import 'package:minimart_ecommerce_preview_app/screens/product_details.dart';
import 'package:minimart_ecommerce_preview_app/theme/color.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void navigateToProductDetails(int index) {
    // Navigate to ProductDetails screen with the selected product
    final shop = context.read<Shop>();
    final productMenu = shop.productMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetails(
          product: productMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Navigate to ProductDetails screen with the selected product
    final shop = context.read<Shop>();
    final productMenu = shop.productMenu;

    return Scaffold(
      backgroundColor:  Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: DottedBorder(
                      color: Colors.blue,
                      strokeWidth: 3,
                      dashPattern: [6, 3],
                      borderType: BorderType.RRect,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        color: secondaryColor,
                        child: Text(
                          "Full Logo",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'DELIVERY ACCESS',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'lib/images/bell.png', 
                      height: 29, 
                      width: 29),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Umuezike Road, Oyo State',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 16, 
                  color: Colors.grey[900]),
              ),
            ),
            const SizedBox(height: 26),
            // Search Bar
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(84, 248, 248, 248),
                prefixIcon: SizedBox(
                  width: 40, 
                  height: 40,
                  child: Icon(Icons.search, color: Colors.grey),
                ),
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              style: TextStyle(color: Colors.grey[900]),
            ),


            const SizedBox(height: 26),

            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey[200],
                    thickness: 1,
                    height: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.arrow_back_ios, size: 16, color: Colors.black), 
                SizedBox(width: 8),
                Text(
                  "Technology",
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Smartphones, Laptops \n& Assecories",  
                    style: TextStyle(
                      fontFamily: 'IBM Plex mono',
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      fontSize: 22, 
                      color: Colors.grey[900]
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2 columns
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.55, // Adjust as needed for your tile shape
                      ),
                      itemCount: 4, // 2 rows × 2 columns = 4 items
                      itemBuilder: (context, index) => ProductTile(
                        product: productMenu[index],
                        onTap: () => navigateToProductDetails(index),
                      ),
                    ),
                  ),
                ],
              ),
            ),
                        
          ],
          
        ),
      ),

      
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 8.0, bottom: 8.0),
            decoration: BoxDecoration(
              color: primaryColor, 
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20), 
            ),
            child: Image.asset(
              'lib/images/home_icon.png',
              height: 28,
              width: 28,
              color: Colors.white, 
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              // Handle navigation to cart
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: Stack(
          children: [
            Image.asset(
              'lib/images/cart_icon.png',
              height: 28,
              width: 28,
              color: Colors.black,
            ),
            if (shop.cart.isNotEmpty)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: BoxConstraints(
                    minWidth: 20,
                    minHeight: 20,
                  ),
                  child: Text(
                    '${shop.cart.length}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
        ),

          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'lib/images/favorite_icon.png',
            height: 28,
            width: 28,
            color: Colors.black, 
          ),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'lib/images/profile_icon.png',
            height: 42,
            width: 68,
            color: Colors.black, 
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: 0,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      onTap: (index) {
        // Handle navigation
      },
    ),    
  );
  }
}

