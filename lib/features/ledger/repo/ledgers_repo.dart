import 'package:bunny_sync/features/add_ledger/models/ledger_model/ledger_model.dart';
import 'package:bunny_sync/features/ledger/models/ledger_stats_model/ledger_stats_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';

part 'http_ledgers_repo.dart';

abstract class LedgersRepo {
  Future<List<LedgerModel>> getLedgers();

  Future<void> deleteLedger(int ledgerId);

  Future<LedgerStatsModel> getLedgerStats();
}
