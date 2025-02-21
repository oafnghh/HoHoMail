import 'package:flutter/material.dart';
import 'package:hoho_mail/screens/HomeScreen/homeScreen.dart';
import 'package:hoho_mail/screens/LoginScreen/loginScreen.dart';
import 'package:hoho_mail/screens/RegisterScreen/registerScreen.dart';

final Map<String,WidgetBuilder> routers = {
  LoginScreen   .routeName :(context) => LoginScreen()    ,
  RegisterScreen.routeName :(context) => RegisterScreen() ,
  HomeScreen    .routeName :(context) => HomeScreen()     ,
};