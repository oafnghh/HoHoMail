import 'package:flutter/material.dart';

class imageCategory extends StatefulWidget {
  const imageCategory({super.key});

  @override
  State<imageCategory> createState() => _imageCategoryState();
}

class _imageCategoryState extends State<imageCategory> {
  final List<String> imgList = List.generate(5, (index) => "assets/images/store${index + 1}.jpg");

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, 
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0), 
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imgList[index],
                width: 150, 
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}