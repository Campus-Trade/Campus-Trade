import 'package:campus_trade/presentation/authentication/widget/signup_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../Cubit/signup_cubit/signup_cubit.dart';
import '../../home/home_screen.dart';

class SignupViewBodyBlocConsumer extends StatefulWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  State<SignupViewBodyBlocConsumer> createState() =>
      _SignupViewBodyBlocConsumerState();
}

class _SignupViewBodyBlocConsumerState
    extends State<SignupViewBodyBlocConsumer> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          print("User data stored successfully in Firestore!");

          if (mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }
        }
        if (state is SignupFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading,
          child: SignUpViewBody(),
        );
      },
    );
  }
}
