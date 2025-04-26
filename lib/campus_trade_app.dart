import 'package:campus_trade/core/services/get_it_sevice.dart';
import 'package:campus_trade/features/auth/domain/repos/auth_repo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/SellScreen/cubit/UploadCubit_class.dart';
import 'features/Upload/Cubit/addproduct_cubit/AddData_Class.dart';
import 'features/Upload/Cubit/addproduct_cubit/TestProduct.dart';
import 'features/auth/data/repos/user_repo_impl.dart';
import 'features/auth/presentation/cubit/signin_cubit/signin_cubit.dart';
import 'features/auth/presentation/cubit/signup_cubit/signup_cubit.dart';
import 'features/auth/presentation/cubit/user_personal_data_cubit/user_cubit.dart';
import 'features/splash/splash.dart';

class CampusTradeApp extends StatelessWidget {
  const CampusTradeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => UploadCubit()),
          BlocProvider(create: (context) => AddData()),
          BlocProvider(create: (context) => Testproduct()),
          BlocProvider(
              create: (context) => SignupCubit(
                    getIt<AuthRepo>(),
                  )),
          BlocProvider(
              create: (context) => SigninCubit(
                    getIt<AuthRepo>(),
                  )),
          BlocProvider<UserCubit>(
            create: (context) =>
                UserCubit(getIt<UserRepository>())..fetchUserData(),
          ),
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
