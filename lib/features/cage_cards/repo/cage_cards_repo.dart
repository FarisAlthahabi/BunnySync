import 'package:bunny_sync/features/cage_cards/model/cage_model/cage_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';

part 'http_cage_cards_repo.dart';

abstract class CageCardsRepo {
  Future<List<CageModel>> getCages();

  Future<void> deleteCageCard(int cageId);
}
