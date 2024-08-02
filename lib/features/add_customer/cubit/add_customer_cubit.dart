import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_customer_state.dart';

class AddCustomerCubit extends Cubit<AddCustomerState> {
  AddCustomerCubit() : super(AddCustomerInitial());
}
