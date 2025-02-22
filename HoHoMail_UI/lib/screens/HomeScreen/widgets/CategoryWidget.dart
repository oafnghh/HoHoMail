import 'package:flutter/material.dart';
import 'package:hoho_mail/screens/HomeScreen/widgets/ImageCategoryWidget.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column( // Đổi Row thành Column để chứa cả Text và Image
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Các cửa hàng",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.orange,
                ),
              ),
              Text(
                "Xem thêm",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          SizedBox(height: 10), // Thêm khoảng cách giữa Text và hình ảnh
          imageCategory(), // Gọi widget đúng cách
        ],
      ),
    );
}
}