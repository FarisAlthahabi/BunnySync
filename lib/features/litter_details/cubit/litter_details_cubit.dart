import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'litter_details_state.dart';

class LitterDetailsCubit extends Cubit<LitterDetailsState> {
  LitterDetailsCubit() : super(LitterDetailsInitial());
}
