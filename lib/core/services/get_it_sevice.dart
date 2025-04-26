import 'package:campus_trade/core/services/firebase_auth_services.dart';
import 'package:campus_trade/features/auth/data/repos/auth_repo_impl.dart';
import 'package:campus_trade/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/user_repo_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<AuthRepo>(
      AuthRepoImpl(firebaseAuthServices: getIt<FirebaseAuthServices>()));
  getIt.registerSingleton<UserRepository>(UserRepository());
}
