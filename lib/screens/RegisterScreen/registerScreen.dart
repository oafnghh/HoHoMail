import 'package:flutter/material.dart';
import 'package:hoho_mail/screens/LoginScreen/loginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    var orange = Colors.orange;
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body:Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              orange[900]!,
              orange[800]!,
              orange[400]!
          ])
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(20),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Login",style: TextStyle(color: Colors.white,fontSize: 40),),
                  SizedBox(height: 10,),
                  Text("Welcome Back",style: TextStyle(color: Colors.white,fontSize: 18),)
                ]
              ) ,
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child:SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 60,),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(255, 95, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10)
                            )
                          ]
                        ),
                        child: Form(
                        key: formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]!))
                                ),
                                child: TextFormField(
                                  validator: (value) {
                                    if(value == null || value.isEmpty){
                                      return 'Please Enter Some Text';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]!))
                                ),
                                child: TextFormField(
                                  validator: (value) {
                                    if(value == null || value.isEmpty){
                                      return 'Please Enter Some Text';
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]!))
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "What is your name ?",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]!))
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "What is your number phone ?",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40,),
                      SizedBox(child: MaterialButton(
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Success')),
                              );
                          }
                        },
                        height: 50,
                        color: Colors.orange[900]!,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                            child: Text("Register", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                      )),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget>[
                          Text("Tôi đã có tài khoản ?",),
                          TextButton(onPressed:(){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=> const LoginScreen()),
                          );
                          } , child: Text("Đăng Nhập", style: TextStyle(color: const Color.fromARGB(255, 91, 62, 223), fontWeight: FontWeight.bold),)),
                        ]
                      )
                    ],
                  ),
                ),
              ),
            ))
          ]
        ),
      ),
    );
  }
}