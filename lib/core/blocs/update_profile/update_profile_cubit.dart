import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../component/constants.dart';
import '../../models/user_model.dart';
import '../../network/repository.dart';
import 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final Repository repository;

  UpdateProfileCubit({
    required this.repository,
  }) : super(UpdateProfileInitial());

  static UpdateProfileCubit get(context) =>
      BlocProvider.of<UpdateProfileCubit>(context);
  UserModel? updateProfileModel;

  void updateProfile({String? email, String? name, XFile? image}) async {
    emit(UserUpdateProfileLoadingState());

    final response = await repository.updateProfile(
      image: File(image!.path),
      name: name!,
      email: email!,
      token: token!,
    );

    response.fold(
      (l) {
        emit(ErrorState(exception: l));
      },
      (r) {
        updateProfileModel = r;

        emit(UserUpdateProfileSuccessState());
      },
    );
  }

  final ImagePicker _picker = ImagePicker();
  XFile? image;

  void pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = pickedFile;

      emit(PickedImageSuccessState());
    }
  }
}
