import 'package:campus_trade/core/services/firebase_auth_services.dart';
import 'package:campus_trade/features/auth/data/repos/auth_repo_impl.dart';
import 'package:campus_trade/features/auth/domain/repos/auth_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/user_repo_impl.dart';
import '../../features/home/data/repo/present_product_repo.dart';
import '../../features/home/presentaion/cubit/present_product_cubit.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<AuthRepo>(
      AuthRepoImpl(firebaseAuthServices: getIt<FirebaseAuthServices>()));
  getIt.registerSingleton<UserRepository>(UserRepository());
  getIt.registerLazySingleton<PresentDataRepo>(
    () => PresentDataRepo(firestore: FirebaseFirestore.instance),
  );
  getIt.registerFactory<ProductCubit>(
    () => ProductCubit(getIt<PresentDataRepo>()),
  );
}
