import 'package:bloc/bloc.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';

part 'states/upload_file_state.dart';

part 'states/general_upload_file_state.dart';

@injectable
class UploadFileCubit extends Cubit<GeneralUploadFileState> {
  UploadFileCubit() : super(UploadFileInitial());

  Future<void> uploadFile() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles();
      final path = result?.files.single.path;

      if (path != null) {
        emit(
          UploadFileSuccess(
            filePath: path,
            fileName: basename(path),
          ),
        );
      } else {
        emit(UploadFileFail('no_file_chosen'.i18n));
      }
    } catch (e) {
      emit(UploadFileFail('no_file_chosen'.i18n));
    }
  }
}
