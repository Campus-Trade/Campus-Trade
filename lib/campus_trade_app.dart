import 'package:campus_trade/presentation/Cubit/Cubit_class.dart';
import 'package:campus_trade/presentation/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CampusTradeApp extends StatelessWidget {
  const CampusTradeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => uploadCubit())],
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
