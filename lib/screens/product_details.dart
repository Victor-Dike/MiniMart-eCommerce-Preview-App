import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:minimart_ecommerce_preview_app/component/button.dart';
import 'package:minimart_ecommerce_preview_app/models/product.dart';
import 'package:minimart_ecommerce_preview_app/models/shop.dart';
import 'package:minimart_ecommerce_preview_app/theme/color.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  

  void addToCart() {
    // add to cart only if there is something in the cart
    if (widget.product.name.isEmpty) {
      // get Access to shop
      final shop = context.read<Shop>();
      // add to cart
      shop.addToCart(widget.product, 1);

      // Let the user know it was successful
    }

    // Logic to add the product to the cart
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            title: Text('Added to Cart'),
            content: Text(
              '${widget.product.name} has been added to your cart.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);

                  // Go back to the previous screen after adding to cart
                  Navigator.pop(context);
                },
                child: Icon(Icons.done),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
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
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
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
                      width: 29,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                  color: Colors.grey[900],
                ),
              ),
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
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Navigates to the previous page
                  },
                  child: Icon(Icons.arrow_back_ios, size: 16, color: Colors.black),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Also navigates to the previous page if "Your Cart" is tapped
                  },
                  child: Text(
                    "Go back",
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ListView(
                  children: [
                    //Image
                    Stack(
                      children: [
                        Image.asset(
                          widget.product.imagePath,
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: 450,
                        ),
                        Positioned(
                          top: 50,
                          right: 20,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white, width: 2),
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(10),
                            child: Image.asset(
                              'lib/images/favorite_icon.png',
                              width: 36,
                              height: 36,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    //Product name
                    Text(
                      '${widget.product.name} - ${widget.product.description}',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[900],
                      ),
                    ),

                    const SizedBox(height: 8),

                    //Price
                    Text(
                      widget.product.price,
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey[900],
                      ),
                    ),

                    const SizedBox(height: 16),

                    //Description
                    Text(
                      "About this item",
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700],
                      ),
                    ),

                    const SizedBox(height: 8),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "• ",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[700],
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.",
                                style: TextStyle(
                                  fontFamily: 'IBM Plex Sans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "• ",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[700],
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "There will be no visible cosmetic imperfections when held at an arm’s length. This product will have a battery which exceeds 80% capacity relative to new.",
                                style: TextStyle(
                                  fontFamily: 'IBM Plex Sans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "• ",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[700],
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Accessories will not be original, but will be compatible and fully functional. Product may come in generic Box. This product is eligible for a replacement or refund within 90 days of receipt if you are not satisfied.",
                                style: TextStyle(
                                  fontFamily: 'IBM Plex Sans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            //Button
            MyButton(
              text: 'Add to Cart',
              onTap: () {
                Provider.of<Shop>(
                  context,
                  listen: false,
                ).addToCart(widget.product, 1);

                showDialog(
                  context: context, 
                  barrierDismissible: false,
                  builder: (context) => AlertDialog(
                    title: Text('Added to Cart'),
                    content: Text(
                      '${widget.product.name} has been added to your cart.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context); // Go back to the previous screen
                        },
                        child: Icon(Icons.done),
                      ),
                    ],
                  ),
                );
                // Optionally show a snackbar or navigate
              },
            ),
          ],
        ),
      ),
    );
  }
}
