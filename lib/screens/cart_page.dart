import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:minimart_ecommerce_preview_app/component/button.dart';
import 'package:minimart_ecommerce_preview_app/models/shop.dart';
import 'package:minimart_ecommerce_preview_app/theme/color.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeProductFromCart(){}

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder:
          (context, value, child) => Scaffold(
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
            child: ListView(
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
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios, size: 16, color: Colors.black),
                    ),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Your Cart",
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
                SizedBox(height: 16),

                // Cart Items
                ...value.cart.entries.map((entry) {
                  final product = entry.key;
                  final quantity = entry.value;
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            product.imagePath,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${product.name} - ${product.description}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      fontFamily: 'IBM Plex Sans',
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    product.price,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontFamily: 'IBM Plex Sans',
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'In stock',
                                    style: TextStyle(
                                      color: Colors.green[900],
                                      fontSize: 13,
                                      fontFamily: 'IBM Plex Sans',
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Provider.of<Shop>(context, listen: false)
                                              .decrementQuantity(product);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey[200],
                                          ),
                                          padding: EdgeInsets.all(14),
                                          child: Icon(Icons.remove, size: 20, color: Colors.grey),
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Text(
                                        '$quantity',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'IBM Plex Sans',
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      InkWell(
                                        onTap: () {
                                          Provider.of<Shop>(context, listen: false)
                                              .incrementQuantity(product);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          padding: EdgeInsets.all(14),
                                          child: Image.asset(
                                            'lib/images/plus_icon.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 0),
                                ],
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: () {
                                    Provider.of<Shop>(context, listen: false).removeFromCart(product);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    padding: EdgeInsets.all(12),
                                    child: Image.asset(
                                      'lib/images/delete_icon.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),

                // Order Info Section (now at the end)
                Builder(
                  builder: (context) {
                    double subtotal = 0;
                    value.cart.forEach((product, qty) {
                      final price = double.tryParse(
                        product.price.replaceAll('\$', ''),
                      ) ?? 0;
                      subtotal += price * qty;
                    });
                    double shipping = subtotal == 0 ? 0 : 10;
                    double grandTotal = subtotal + shipping;

                    return Container(
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          // BoxShadow(
                          //   color: Colors.white,
                          //   blurRadius: 8,
                          //   spreadRadius: 2,
                          // ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Order Info",
                            style: TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subtotal",
                                style: TextStyle(
                                  fontFamily: 'IBM Plex Sans',
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                "\$${subtotal.toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontFamily: 'IBM Plex Sans',
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Shipment Charge",
                                style: TextStyle(
                                  fontFamily: 'IBM Plex Sans',
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                shipping == 0 ? "Free" : "\$${shipping.toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontFamily: 'IBM Plex Sans',
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Divider(height: 24, thickness: 1, color: Colors.grey[300]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                  fontFamily: 'IBM Plex Sans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "\$${grandTotal.toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontFamily: 'IBM Plex Sans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),

                // Checkout Button
                Builder(
                  builder: (context) {
                    double total = 0;
                    value.cart.forEach((product, qty) {
                      final price = double.tryParse(
                        product.price.replaceAll('\$', ''),
                      ) ?? 0;
                      total += price * qty;
                    });
                    return MyButton(
                      text: 'Checkout  \$${total.toStringAsFixed(2)}',
                      onTap: value.cart.isEmpty ? null : () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Proceeding to checkout...')),
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: 16),
              ],
            ),
          ),      ),
    );
  }
}
