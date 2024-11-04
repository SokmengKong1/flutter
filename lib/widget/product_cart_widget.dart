import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/products/products.dart';

class ProductCartWidget extends StatelessWidget {
  Products products;
  VoidCallback? onTanImage;
  Color? backgroundColor;
  ProductCartWidget(
      {super.key,
      required this.products,
      this.onTanImage,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        height: 250,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.black12,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                onTap: onTanImage,
                child: Image.network(
                  products.thumbnail ?? "",
                  fit: BoxFit.cover,
                  height: 120,
                ),
              ),
            ),
            Text(
              products.title ?? "",
              style: TextStyle(fontSize: 11),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ ${products.price}",
                    style: TextStyle(color: Colors.red),
                  ),
                  Text(
                    "View: ${products.reviews!.length}",
                    style: TextStyle(color: Colors.blue, fontSize: 10),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
