import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hoho_mail/screens/HomeScreen/homeScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
class AuthService {
  final   FirebaseAuth    _auth   =   FirebaseAuth.instance;

  Future<String?> signup({
    required String       email   ,
    required String       password,
    required BuildContext context ,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password)                  ;
      await Future.delayed(const Duration(seconds: 1))                                              ;
      // ignore: use_build_context_synchronously
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
      Fluttertoast.showToast(
        msg             : message,
        toastLength     : Toast.LENGTH_LONG,
        gravity         : ToastGravity.SNACKBAR,
        backgroundColor : Colors.black54,
        textColor       : Colors.white,
        fontSize        : 14.0,
      );
    } catch (e) {
      return "Lỗi hệ thống: ${e.toString()}";
    }
    return null;
  }
}
