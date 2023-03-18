import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weather_whenever/data/repository/search_location/search_location_repository.dart';
import 'package:weather_whenever/typography/text_styles.dart';
import 'package:weather_whenever/utils/app_colors.dart';
import 'package:weather_whenever/views/search/bloc/search_bloc.dart';

import '../../../data/models/search_location/search_location_model.dart';
import '../../../di/service_locator.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(
          searchLocationRepository: getIt<SearchLocationRepository>()),
      child: const _SearchPageView(),
    );
  }
}

class _SearchPageView extends HookWidget {
  const _SearchPageView();

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = useTextEditingController(text: '');

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(color: Colors.grey, Icons.arrow_back),
              )),
          actions: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    style: CustomTextStyles.headline2.size20,
                    onChanged: (value) => context
                        .read<SearchBloc>()
                        .add(SearchEvent.getLocations(query: value)),
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search your city...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: IconButton(
                    icon: const Icon(color: Colors.grey, Icons.clear),
                    onPressed: () => searchController.clear(),
                  ),
                )
              ],
            ),
          ],
        ),
        body: BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
          return state.when(
              initial: () => Center(
                    child: Text(
                      'No Suggestions',
                      style: CustomTextStyles.baseTextStyle.size18,
                    ),
                  ),
              loaded: (List<SearchLocationModel> searchLocationModel) {
                return ListView.builder(
                    itemCount: searchLocationModel.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        subtitle: Text(
                          searchLocationModel[index].placeNameEn ?? '',
                          style: CustomTextStyles.baseTextStyle.size20,
                        ),
                        onTap: () => debugPrint(
                            '''${searchLocationModel[index].placeNameEn ?? ''} ${searchLocationModel[index].coordinates!.latitude.toString()}'''),
                      );
                    });
              },
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ));
        }));
  }
}
