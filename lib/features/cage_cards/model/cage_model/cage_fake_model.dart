import 'package:bunny_sync/features/add_cage/model/cage_orientation_types/cage_orientation_types.dart';
import 'package:bunny_sync/features/add_cage/model/cage_size_types/cage_size_types.dart';
import 'package:bunny_sync/features/cage_cards/model/cage_model/cage_model.dart';
import 'package:bunny_sync/global/utils/enums/answer_types.dart';
import 'package:bunny_sync/global/utils/enums/rabbit_types.dart';

final fakeCages = List.generate(
  4,
  (index) => CageModel(
    id: index,
    userId: 51,
    name: 'cage',
    type: RabbitTypes.breeder,
    size: CageSizeTypes.index3X5,
    orientation: CageOrientationTypes.horizontal,
    hole: AnswerTypes.yes,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
);
