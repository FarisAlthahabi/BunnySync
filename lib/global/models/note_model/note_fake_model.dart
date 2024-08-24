import 'package:bunny_sync/global/models/note_model/note_model.dart';

final notesFake = List.generate(
  4,
  (index) => NoteModel(
    id: 1,
    breederId: 1,
    title: 'Breeder notes',
    note: 'note',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    dtRowIndex: 1,
  ),
);
