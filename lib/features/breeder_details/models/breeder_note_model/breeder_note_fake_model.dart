import 'package:bunny_sync/features/breeder_details/models/breeder_note_model/breeder_note_model.dart';

final breederNotesFake = List.generate(
  1,
  (index) => BreederNoteModel(
    id: 1,
    breederId: 1,
    title: 'Breeder notes',
    note: 'note',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    dtRowIndex: 1,
  ),
);
