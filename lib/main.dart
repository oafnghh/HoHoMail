import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hoho_mail/firebase_options.dart';
import 'package:hoho_mail/screens/LoginScreen/loginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print(" Firebase đã khởi tạo thành công!");
  } catch (e) {
    print("Lỗi khi khởi tạo Firebase: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

