import 'package:campus_trade/presentation/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CampusTradeApp extends StatelessWidget {
  const CampusTradeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(designSize: Size(393, 852),minTextAdapt:true,
        builder: (context,child)=>MaterialApp
      (debugShowCheckedModeBanner: false,home:  Splash()));
  }
}
