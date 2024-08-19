import 'package:bloc/bloc.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/upload_file_state.dart';

part 'states/general_upload_file_state.dart';

@injectable
class UploadFileCubit extends Cubit<GeneralUploadFileState> {
  UploadFileCubit() : super(UploadFileInitial());

  void uploadFile(String? filePath) {
    try {
      if (filePath != null) {
      emit(UploadFileSuccess(filePath));
    }else{
      emit(UploadFileFail('no_file_chosen'.i18n));
    }
    } catch (e) {
      emit(UploadFileFail('no_file_chosen'.i18n));
    }
    
  }
}
