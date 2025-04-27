import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/user_model.dart';
import '../../../data/repos/user_repo_impl.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;
  final String uid;

  UserCubit(this.userRepository, this.uid) : super(UserInitial());

  Future<void> fetchUserData() async {
    // Removed the unnecessary parameter
    emit(UserLoading());
    try {
      if (uid.isEmpty) {
        emit(UserError("User ID is required"));
        return;
      }

      print("User ID: $uid");

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
