import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/profile/model/profile_types/profile_types.dart';
import 'package:bunny_sync/features/profile/model/user_model/user_fake_model.dart';
import 'package:bunny_sync/features/profile/model/user_model/user_model.dart';
import 'package:bunny_sync/features/profile/model/user_post_model/user_post_model.dart';
import 'package:bunny_sync/features/profile/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/profile_state.dart';

part 'states/general_profile_state.dart';

part 'states/set_selected_type_state.dart';

part 'states/update_profile_state.dart';

@injectable
class ProfileCubit extends Cubit<GeneralProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileInitial());

  final ProfileRepo _profileRepo;

  late UserModel userModel;

  UserPostModel _userPostModel = const UserPostModel();

  void setFirstName(String? firstName) {
    _userPostModel = _userPostModel.copyWith(
      firstName: () => firstName,
    );
  }

  void setLastName(String? lastName) {
    _userPostModel = _userPostModel.copyWith(
      lastName: () => lastName,
    );
  }

  void setAddress(String? address) {
    _userPostModel = _userPostModel.copyWith(
      address: () => address,
    );
  }

  void setPhoneNumber(String? phoneNumber) {
    _userPostModel = _userPostModel.copyWith(
      phoneNumber: () => phoneNumber,
    );
  }

  void setCity(String? city) {
    _userPostModel = _userPostModel.copyWith(
      city: () => city,
    );
  }

  void setState(String? state) {
    _userPostModel = _userPostModel.copyWith(
      state: () => state,
    );
  }

  void setType(ProfileTypes? type) {
    _userPostModel = _userPostModel.copyWith(
      type: () => type,
    );

    emit(SetSelectedTypeState(type));
  }

  void setSearch(String? search) {
    _userPostModel = _userPostModel.copyWith(
      search: () => search,
    );
  }

  Future<void> getProfile() async {
    emit(ProfileLoading(fakeUser));

    try {
      final user = await _profileRepo.getUserInfo();
      userModel = user;
      emit(ProfileSuccess(user));
    } catch (e, s) {
      addError(e, s);
      emit(ProfileFail(e.toString()));
    }
  }

  Future<void> updateProfileInfo() async {
    emit(UpdateProfileLoading());

    try {
      final user = await _profileRepo.updateUserInfo(_userPostModel);
      userModel = user.copyWith(
        email: user.email,
        id: user.id,
        planId: user.planId,
        name: user.name,
        registeredAt: user.registeredAt,
        subscriptions: user.subscriptions,
        trials: user.trials,
      );

      emit(UpdateProfileSuccess());
      emit(ProfileSuccess(userModel));
    } catch (e, s) {
      addError(e, s);
      emit(UpdateProfileFail(e.toString()));
    }
  }
}
