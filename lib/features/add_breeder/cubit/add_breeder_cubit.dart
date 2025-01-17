import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/add_breeder/models/post_add_breeder_model/post_add_breeder_model.dart';
import 'package:bunny_sync/features/add_breeder/repo/add_breeder_repo.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/utils/enums/gender_types_enum.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/breeder_name_post_state.dart';

part 'states/add_breeder_state.dart';

part 'states/general_add_breeder_state.dart';

@injectable
class AddBreederCubit extends Cubit<GeneralAddBreederState> {
  AddBreederCubit(this._addBreederRepo) : super(AddBreederInitial());

  final AddBreederRepo _addBreederRepo;

  BreederEntryModel? breeder;

  PostAddBreederModel _postAddBreederModel = const PostAddBreederModel();

  void setName(String name) {
    _postAddBreederModel = _postAddBreederModel.copyWith(
      name: () => name,
    );
  }

  void setPrefix(String? prefix) {
    _postAddBreederModel = _postAddBreederModel.copyWith(
      prefix: () => prefix,
    );
  }

  void setCage(String? cage) {
    _postAddBreederModel = _postAddBreederModel.copyWith(
      cage: () => cage,
    );
  }

  void setGender(GenderTypes gender) {
    _postAddBreederModel = _postAddBreederModel.copyWith(
      gender: () => gender.name,
    );
  }

  void setColor(String? color) {
    _postAddBreederModel = _postAddBreederModel.copyWith(
      color: () => color,
    );
  }

  void setTatto(String? tatto) {
    _postAddBreederModel = _postAddBreederModel.copyWith(
      tatto: () => tatto,
    );
  }

  void setWeight(String? weight) {
    if (weight == null) {
      return;
    }

    final firstPart = weight.split(' ')[0];
    _postAddBreederModel = _postAddBreederModel.copyWith(
      weight: () => double.tryParse(firstPart),
    );
  }

  void setDate(DateTime date) {
    _postAddBreederModel = _postAddBreederModel.copyWith(
      date: () => date,
    );
  }

  Future<void> addBreeder() async {
    final nameError = _postAddBreederModel.validateName();
    if (nameError != null) {
      emit(BreederNamePostInvalid(nameError));
      return;
    }

    emit(AddBreederLoading());

    try {
      final response = await _addBreederRepo.addBreeder(_postAddBreederModel);
      emit(AddBreederSuccess(response.data));
    } catch (e, s) {
      addError(e, s);
      emit(AddBreederFail(e.toString()));
    }
  }

  Future<void> updateBreeder(int breederId) async {
    final nameError = _postAddBreederModel.validateName();
    if (nameError != null) {
      emit(BreederNamePostInvalid(nameError));
      return;
    }

    emit(AddBreederLoading());

    try {
      final response =
          await _addBreederRepo.updateBreeder(breederId, _postAddBreederModel);

      final breeder = this.breeder?.merge(response.data);

      if (breeder == null) {
        emit(AddBreederFail('failed_to_update_breeder'.i18n));
        return;
      }
      emit(UpdateBreederSuccess(breeder));
    } catch (e, s) {
      addError(e, s);
      emit(AddBreederFail(e.toString()));
    }
  }
}
