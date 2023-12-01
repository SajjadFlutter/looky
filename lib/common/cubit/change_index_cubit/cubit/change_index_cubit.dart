import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_index_state.dart';

class ChangeIndexCubit extends Cubit<ChangeIndexState> {
  ChangeIndexCubit() : super(ChangeIndexState(index: 0));

  void changeIndexEvent(int newIndex) {
    emit(ChangeIndexState(index: newIndex));
  }
}
