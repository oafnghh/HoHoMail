import 'package:flutter/material.dart';
import 'package:hoho_mail/screens/RegisterScreen/registerScreen.dart';
import 'package:hoho_mail/services/authService.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final                       formKey             = GlobalKey<FormState>();
    final TextEditingController emailController     = TextEditingController();
    final TextEditingController passwordController  = TextEditingController();
    var                         orange              = Colors.orange;
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
                  child: Form(
                    key: formKey,
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
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]!))
                                ),
                                child: TextFormField(
                                  controller: emailController,
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
                                  controller: passwordController,
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
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 40,),
                        SizedBox(child: MaterialButton(
                          onPressed: (){
                            if(formKey.currentState!.validate())
                            {
                              String email = emailController.text.trim();
                              String password = passwordController.text.trim();                        
                              AuthService().signin(email: email, password: password,context: context);
                            }
                          },
                          height: 50,
                          color: Colors.orange[900]!,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        )),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[
                            Text("Tôi chưa có tài khoản ?",),
                            TextButton(onPressed:(){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=> const RegisterScreen()),
                            );
                            } , child: Text("Đăng kí", style: TextStyle(color: const Color.fromARGB(255, 91, 62, 223), fontWeight: FontWeight.bold),)),
                          ]
                        )
                      ],
                    ),
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