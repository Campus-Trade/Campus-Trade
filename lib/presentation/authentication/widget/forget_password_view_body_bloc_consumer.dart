import 'dart:developer';

import 'package:campus_trade/presentation/Cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:campus_trade/presentation/authentication/view/signin_view.dart';
import 'package:campus_trade/presentation/authentication/widget/forget%20_passwod_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgetPasswordViewBodyBlocConsumer extends StatelessWidget {
  const ForgetPasswordViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          log("email is sent");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SigninView(),
            ),
          );
        }

        if (state is ForgetPasswordFailure) {
          SnackBar(
            content: Text(state.message),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ForgetPasswordLoading ? true : false,
          child: ForgetPasswordViewBody(),
        );
      },
    );
  }
}
