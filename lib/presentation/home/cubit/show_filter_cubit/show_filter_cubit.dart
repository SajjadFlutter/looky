import 'package:flutter_bloc/flutter_bloc.dart';

part 'show_filter_state.dart';

class ShowFilterCubit extends Cubit<ShowFilterState> {
  ShowFilterCubit() : super(ShowFilterState(showFilter: false));

  void showFilter(bool showFilter) {
    emit(ShowFilterState(showFilter: showFilter));
  }
}
