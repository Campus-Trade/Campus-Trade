import 'package:campus_trade/presentation/Cubit/TestProduct.dart';
import 'package:campus_trade/presentation/Cubit/UploadCubit_class.dart';
import 'package:campus_trade/presentation/SellScreen/Sellscreen.dart';
import 'package:campus_trade/presentation/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'presentation/Cubit/AddData_Class.dart';

class CampusTradeApp extends StatelessWidget {
  const CampusTradeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => UploadCubit()),
          BlocProvider(create: (context) => AddData()),
          BlocProvider(create: (context) => Testproduct())
        ],
        child: ScreenUtilInit(
          designSize: const Size(393, 852),
          minTextAdapt: true,
          builder: (context, child) => const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Splash(),
          ),
        ));
  }
}
