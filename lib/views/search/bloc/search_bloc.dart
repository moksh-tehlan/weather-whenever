import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_whenever/data/repository/search_location/search_location_repository.dart';

import '../../../data/models/search_location/search_location_model.dart';

part 'search_state.dart';
part 'search_event.dart';
part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchLocationRepository searchLocationRepository;
  SearchBloc({required this.searchLocationRepository})
      : super(const SearchState.initial()) {
    on<_GetLocation>(_onGetLocation);
  }

  Future<void> _onGetLocation(
      _GetLocation event, Emitter<SearchState> emit) async {
    emit(const _Loading());

    // fetching list of cities on the give query

    final List<SearchLocationModel> model =
        await searchLocationRepository.getSearchedLocation(query: event.query);

    emit(_Loaded(searchLocationModel: model));
  }
}
