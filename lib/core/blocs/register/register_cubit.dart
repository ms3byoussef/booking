import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/register_model.dart';
import '../../network/repository.dart';
import '../../utils/shared_preferences.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final Repository repository;

  RegisterCubit({
    required this.repository,
  }) : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of<RegisterCubit>(context);

  RegisterModel? registerModel;

  void userRegister({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
  }) async {
    emit(UserRegisterLoadingState());

    final response = await repository.register(
      name: name!,
      email: email!,
      password: password!,
      confirmPassword: confirmPassword!,
    );

    response.fold(
      (l) {
        emit(ErrorState(exception: l));
      },
      (r) async {
        registerModel = r;
        CacheHelper.saveData(key: 'isLogin', value: true);
        CacheHelper.saveData(
            key: 'token', value: registerModel!.data!.token.toString());
        CacheHelper.saveData(key: 'id', value: registerModel!.data!.id);
        emit(UserRegisterSuccessState());
      },
    );
  }
}
