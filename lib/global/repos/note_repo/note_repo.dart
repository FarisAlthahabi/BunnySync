import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/models/note_model/note_model.dart';
import 'package:injectable/injectable.dart';

part 'http_note_repo.dart';

abstract class NoteRepo {
 Future<List<NoteModel>> getNotes({
    int? breederId,
    int? litterId,
  });

  Future<void> deleteNote({
    int? breederId,
    int? litterId,
  });
}
