part of '../add_task_cubit.dart';

abstract class DropDownState extends GeneralAddTaskState implements DropDownItemModel {}

class WhoDropDownState<T extends DropDownItemModel>
    extends DropDownState {
  WhoDropDownState(
    this.model,
  );
  final T? model;
  
  @override
  // TODO: implement id
  int get id => throw UnimplementedError();
  
  @override
  // TODO: implement name
  String get name => throw UnimplementedError();
}
