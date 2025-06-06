import 'package:flutter/material.dart';
import 'package:minimart_ecommerce_preview_app/models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final void Function()? onTap;
  const ProductTile({
    super.key,
    required this.product,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(158, 158, 158, 0.216),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        
        // margin: const EdgeInsets.symmetric(horizontal: 10.0),
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Product Image
            Image.asset(
              product.imagePath,
              fit: BoxFit.contain,
              width: product.name == 'Apple iPhone 16' ? double.infinity : double.infinity, // Reduced width for iPhone 16
              height: product.name == 'Apple iPhone 16' ? 162 : 162,           // Reduced height for iPhone 16
            ),
      
            //Product Name
            Text(
              product.name,
              style: TextStyle( 
                fontFamily: 'IBM Plex Sans',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
      
            //Product description
            Text(
              product.description,
              style: TextStyle( 
                fontFamily: 'IBM Plex Sans',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
      
            //Product Price
            Text(
             product.price,
              style: TextStyle( 
                fontFamily: 'IBM Plex Sans',
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
