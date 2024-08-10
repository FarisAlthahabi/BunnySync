import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/profile/model/user_model/user_fake_model.dart';
import 'package:bunny_sync/features/profile/model/user_model/user_model.dart';
import 'package:bunny_sync/features/profile/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/profile_state.dart';

part 'states/general_profile_state.dart';

@injectable
class ProfileCubit extends Cubit<GeneralProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileInitial());

  final ProfileRepo _profileRepo;

  Future<void> getprofile() async {
    emit(ProfileLoading(fakeUser));
    
    try {
      final profile = await _profileRepo.getUserInfo();
      emit(ProfileSuccess(profile));
    } catch (e, s) {
      addError(e, s);
      emit(ProfileFail(e.toString()));
    }
  }
    //TODO.............................
  Future<void> updateProfileInfo() async {
    emit(UpdateProfileLoading());
    
    try {
      // final profile = await _profileRepo.updateUserInfo();
      // emit(UpdateProfileSuccess(profile));
    } catch (e, s) {
      addError(e, s);
      emit(UpdateProfileFail(e.toString()));
    }
  }
}
