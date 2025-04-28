import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import '../../../features/auth/data/models/user_model.dart';
import '../../../features/auth/data/repos/user_repo_impl.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;

  UserCubit(this.userRepository) : super(UserInitial());

  Future<void> fetchUserData() async {
    emit(UserLoading());
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        emit(UserError("Not logged in"));
        return;
      }

      print("Firebase UID: $uid");

      final result = await userRepository.getUserById(uid);
      result.fold(
        (failure) => emit(UserError(failure.message)),
        (user) => emit(UserLoaded(user)),
      );
    } catch (e) {
      emit(UserError("Error fetching user: ${e.toString()}"));
    }
  }
}
