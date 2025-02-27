import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  final List<Map<String, dynamic>> products = [
    {
      "image": "https://photo.znews.vn/w660/Uploaded/yqdxwpjwq/2020_08_27/nike_air_max_1.jpg",
      "name": "BABY THREE",
      "price": "357.000 ₫",
      "originalPrice": "549K",
      "discount": "-38%",
      "sold": "9.9k",
    },
    {
      "image": "https://photo.znews.vn/w660/Uploaded/yqdxwpjwq/2020_08_27/nike_air_max_1.jpg",
      "name": "BABY THREE",
      "price": "11.110 ₫",
      "originalPrice": "15K",
      "discount": "-54%",
      "sold": "44.7k",
    },
    {
      "image": "https://photo.znews.vn/w660/Uploaded/yqdxwpjwq/2020_08_27/nike_air_max_1.jpg",
      "name": "BABY THREE",
      "price": "200.000 ₫",
      "originalPrice": "300K",
      "discount": "-36%",
      "sold": "12k",
    },
    {
      "image": "https://photo.znews.vn/w660/Uploaded/yqdxwpjwq/2020_08_27/nike_air_max_1.jpg",
      "name": "BABY THREE",
      "price": "250.000 ₫",
      "originalPrice": "480K",
      "discount": "-48%",
      "sold": "5.6k",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(), 
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.7, 
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image(
                        image: NetworkImage(
                          product["image"],
                        ),
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset("assets/images/nike.webp"); 
                        },
                      )

                    ),
                    Positioned(
                      top: 5,
                      left: 5,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                        color: Colors.red,
                        child: Text(
                          product["discount"],
                          style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product["name"],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Text(
                        product["price"],
                        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      const SizedBox(width: 100,height: 20,),
                      Text(
                        product["originalPrice"],
                        style: const TextStyle(color: Colors.grey, fontSize: 12, decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                  child: Text(
                    "Đã bán ${product["sold"]}",
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}