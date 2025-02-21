import 'package:flutter/material.dart';

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
      body: SafeArea(
        child:SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenWidth * 0.6,
                   //   height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: TextField(
                        onChanged: (value){},
                        decoration: InputDecoration(
                          isDense: true,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "Tìm kiếm sản phẩm",
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      borderRadius: BorderRadius.circular(50),
                      child: Stack(
                        children: [
                          Container(
                            height: 50,
                            width : 50,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              shape: BoxShape.circle
                            ),
                            child: Icon(
                              Icons.notifications,
                              color: Colors.black54,
                              size: 24, 
                            ),
                          ),
                          Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              shape: BoxShape.circle,
                              border: Border.all(width: 1.5, color: Colors.white),
                            ),
                            child: Center( 
                              child: Text(
                                "3",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold, 
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      borderRadius: BorderRadius.circular(50),
                      child: Stack(
                        children: [
                          Container(
                            height: 50,
                            width : 50,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              shape: BoxShape.circle
                            ),
                            child: Icon(
                              Icons.shopping_cart,
                              color: Colors.black54,
                              size: 24, 
                            ),
                          ),
                          Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              shape: BoxShape.circle,
                              border: Border.all(width: 1.5, color: Colors.white),
                            ),
                            child: Center( 
                              child: Text("3",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold, 
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ),
      )
    );
  }
}