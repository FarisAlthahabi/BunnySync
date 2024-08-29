import 'package:bunny_sync/features/add_ledger/models/ledger_model/ledger_model.dart';
import 'package:bunny_sync/features/add_ledger/models/ledger_post_model/ledger_post_model.dart';
import 'package:bunny_sync/global/dio/dio.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

part 'http_add_ledger_repo.dart';

abstract class AddLedgerRepo {
  Future<LedgerModel> addLedger(
    LedgerPostModel ledgerPostModel,
  );

  Future<LedgerModel> updateLedger(
    LedgerPostModel ledgerPostModel,
    int ledgerId,
  );
}
