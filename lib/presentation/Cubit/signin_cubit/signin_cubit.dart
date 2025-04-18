import 'package:bloc/bloc.dart';
import 'package:campus_trade/features/auth/data/models/login_request_model.dart';
import '../../../features/auth/domain/repos/auth_repo.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;

  Future<void> signin(LoginRequestModel loginRequestModel) async {
    emit(SigninLoading());
    var result = await authRepo.signInWithEmailAndPassword(loginRequestModel);
    result.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (id) {
        // save id to shared preferences
        emit(SigninSuccess());
      },
    );
  }
}
