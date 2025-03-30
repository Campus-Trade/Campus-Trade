import 'package:bloc/bloc.dart';
import 'package:campus_trade/features/auth/domain/entities/user_entity.dart';
import 'package:campus_trade/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;
  Future<void> createUserWithEmailAndPassword(
      String email,
      String password,
      String firstName,
      String lastName,
      String mobileNumber,
      String image,
      String university,
      String faculty) async {
    emit(SignupLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
        email,
        password,
        firstName,
        lastName,
        mobileNumber,
        image,
        university,
        faculty);
    result.fold(
      (failure) => emit(SignupFailure(message: failure.message)),
      (userEntity) => emit(SignupSuccess(userEntity: userEntity)),
    );
  }
}
