import 'package:bunny_sync/features/add_note/model/add_note_model/add_note_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';

part 'http_add_note_repo.dart';

abstract class AddNoteRepo {
  Future<void> addNote(
    AddNoteModel addNoteModel,
    int breederId,
  );
}
