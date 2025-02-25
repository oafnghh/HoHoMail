import 'package:flutter/material.dart';
import 'package:hoho_mail/screens/HomeScreen/widgets/CategoryWidget.dart';
import 'package:hoho_mail/screens/HomeScreen/widgets/CircleIconButtonWidget.dart';
import 'package:hoho_mail/screens/HomeScreen/widgets/SlideShowWidget.dart';

class HomeScreen extends StatefulWidget {
  static var routeName = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SlideShow(),
                CategoryWidget()
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea( // Thêm SafeArea để tránh đè lên status bar
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenWidth * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                          isDense: true,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "Tìm kiếm sản phẩm",
                          prefixIcon: Icon(Icons.search, color: Color.fromARGB(255, 9, 9, 9)),
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                        ),
                      ),
                    ),
                    CircleIconButton(
                      icon: Icons.notifications,
                      notificationCount: 3,
                      onTap: () {
                        print("Thông báo được nhấn");
                      },
                    ),
                    CircleIconButton(
                      icon: Icons.shopping_cart,
                      notificationCount: 3,
                      onTap: () {
                        print("Giỏ hàng được nhấn");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
