import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samo_crm/ui/pages/sign_up_page/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(360, 690),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignUpPage(),
      ),
    );
  }
}
