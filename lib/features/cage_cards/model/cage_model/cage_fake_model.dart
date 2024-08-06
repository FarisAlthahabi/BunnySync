import 'package:bunny_sync/features/cage_cards/model/cage_model/cage_model.dart';
import 'package:bunny_sync/global/utils/enums/answer_types_enum.dart';

final fakeCages = List.generate(
  4,
  (index) => CageModel(
    id: index,
    userId: 51,
    name: 'cage',
    type: 'breeder',
    size: '2 * 3',
    orientation: 'vertical',
    hole: AnswerTypes.yes,
    settings:
        '["blank","prefix","name","breed","cage","tattoo","sex","father","mother","color","weight","acquired","date_of_birth","images","culled","kits","category","genotype","current_weight","weight_date","v_w_du_genotype"]',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
);
