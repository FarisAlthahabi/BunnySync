import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_litter_state.dart';

class AddLitterCubit extends Cubit<AddLitterState> {
  AddLitterCubit() : super(AddLitterInitial());
}
