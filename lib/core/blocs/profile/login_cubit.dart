import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/login_model.dart';
import '../../network/repository.dart';
import '../../utils/shared_preferences.dart';
import '../login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Repository repository;

  LoginCubit({
    required this.repository,
  }) : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);

  LoginModel? loginModel;

  void userLogin({String? email, String? password}) async {
    emit(UserLoginLoadingState());

    final response = await repository.login(
      email: email!,
      password: password!,
    );

    response.fold(
      (l) {
        emit(ErrorState(exception: l));
      },
      (r) async {
        loginModel = r;
        CacheHelper.saveData(key: 'isLogin', value: true);
        CacheHelper.saveData(
            key: 'token', value: loginModel!.data!.token.toString());
        CacheHelper.saveData(key: 'id', value: loginModel!.data!.id);
        emit(UserLoginSuccessState());
      },
    );
  }
}
