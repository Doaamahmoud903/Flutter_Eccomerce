import 'package:eccomerce_app/features/layout/presentation/manager/search/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState.initial());

  void search(String keyword) {
    emit(SearchState(keyword: keyword));
    // If you need to actually execute search here, do it
  }

  void clear() {
    emit(SearchState.initial());
  }
}