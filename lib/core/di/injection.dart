import 'package:booking_app_algoriza/core/blocs/profile/login_cubit.dart';
import 'package:booking_app_algoriza/core/blocs/profile/profile_cubit.dart';
import 'package:booking_app_algoriza/core/blocs/register/register_cubit.dart';
import 'package:booking_app_algoriza/core/blocs/update_profile/update_profile_cubit.dart';
import 'package:booking_app_algoriza/core/utils/app_cubit.dart';
import 'package:get_it/get_it.dart';

import '../network/dio_helper.dart';
import '../network/repository.dart';

var sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => LoginCubit(
        repository: sl(),
      ));
  sl.registerFactory(() => RegisterCubit(
        repository: sl(),
      ));
  sl.registerFactory(() => ProfileCubit(
        repository: sl(),
      ));
  sl.registerFactory(() => UpdateProfileCubit(
        repository: sl(),
      ));
  sl.registerFactory(() => AppCubit(
        repository: sl(),
      ));

  sl.registerLazySingleton<DioHelper>(
    () => DioHelper(),
  );

  sl.registerLazySingleton<Repository>(
    () => RepositoryImplementation(
      dioHelper: sl(),
    ),
  );
}
