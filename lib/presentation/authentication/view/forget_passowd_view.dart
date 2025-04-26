import 'package:campus_trade/presentation/Cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:campus_trade/presentation/authentication/widget/forget_password_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/get_it_sevice.dart';
import '../../../features/auth/domain/repos/auth_repo.dart';
import '../../Cubit/signin_cubit/signin_cubit.dart';
import '../widget/signin_view_body_bloc_consumer.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        body: const ForgetPasswordViewBodyBlocConsumer(),
      ),
    );
  }
}
