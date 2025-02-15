import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hoho_mail/screens/HomeScreen/homeScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
class AuthService {
  final   FirebaseAuth      _auth       =   FirebaseAuth.instance     ;
  final   FirebaseFirestore _firestore  =   FirebaseFirestore.instance;

  Future<String?> signup({
    required  String       name    ,
    required  String       email   ,
    required  String       password,
    required  String       phone   ,
              String?      image   ,
    required BuildContext context  ,
  }) async {
    try {
      var checkPhone = await _firestore.collection("ta_users")
        .where("phone", isEqualTo: phone)
        .get();
      if (checkPhone.docs.isNotEmpty) {
        _showError("Số điện thoại đã tồn tại!");
        return null;
      }
      UserCredential userCredential =  await _auth.createUserWithEmailAndPassword(email: email, password: password)                  ;
      String        uid  = userCredential.user!.uid;
      await _firestore.collection("ta_users").doc(uid).set({
        "id"              : uid,
        "email"           : email,
        "password"        : password,
        "phone"           : phone,
        "createdAt"       : FieldValue.serverTimestamp(),
      });
      await Future.delayed(const Duration(seconds: 1))                                              ;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen())) ;
    } on FirebaseAuthException catch (e) {
      String  message   = '';
      if (e.code        == 'email-already-in-use') {
              message   = "Email đã tồn tại!";
      } else if (e.code == 'weak-password') {
              message   = "Mật khẩu quá yếu!";
      } else if (e.code == 'invalid-email') {
              message   = "Email không hợp lệ!";
      } else {
              message   = "Lỗi không xác định: ${e.message}";
      }
      _showError(message);
    } catch (e) {
      return "Lỗi hệ thống: ${e.toString()}";
    }
    return null;
  }
  //------------------------------------------------------------------------------------//
  //------------------------------------------------------------------------------------//
  Future<bool?> signin({
    required  String       email   ,
    required  String       password,
    required  BuildContext context  ,
  })
  async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user == null) {
        _showError("Tài khoản không hợp lệ!");
        return false;
      }
      var abc = user.uid;
      DocumentSnapshot<Map<String, dynamic>> userData =
          await _firestore.collection("ta_users").doc(user.uid).get();
      if (!userData.exists) {
        _showError("Không tìm thấy thông tin tài khoản!");
        return false;
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );

      return true;
    } on FirebaseAuthException catch (e) {
      String message = "Lỗi không xác định!";
    switch (e.code) {
      case 'user-not-found':
        message = "Tài khoản không tồn tại!";
        break;
      case 'wrong-password':
        message = "Mật khẩu không chính xác!";
        break;
      case 'invalid-email':
        message = "Email không hợp lệ!";
        break;
      default:
        message = "Lỗi: ${e.message}";
    }
    _showError(message);
      return false;
    } catch (e) {
      _showError("Lỗi hệ thống: ${e.toString()}");
      return false;
    }
  }

  void _showError(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }
}
