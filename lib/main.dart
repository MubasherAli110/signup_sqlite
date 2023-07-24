import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:signup_sqlite/pages/sign_up.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(782, 1024),
        builder: (context, child) => MaterialApp(
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const SignUp(),
            ));
  }
}
