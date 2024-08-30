import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/core/ui/mixins/search_mixin.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/location/data/models/selectable.dart';
import 'package:food_driver/features/location/presentation/bloc/country/country_bloc.dart';
import 'package:food_driver/features/location/presentation/pages/base_location_page.dart';
import 'package:food_driver/features/location/presentation/widgets/interactive_list.dart';
import 'package:food_driver/features/location/presentation/widgets/list_item.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class CountryListPage extends StatelessWidget {
  const CountryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CountryBloc>(),
      child: const CountryBody(),
    );
  }
}

class CountryBody extends StatefulWidget {
  const CountryBody({super.key});

  @override
  State<CountryBody> createState() => _CountryBodyState();
}

class _CountryBodyState extends State<CountryBody>
    with SearchMixin<CountryBody> {
  @override
  Widget build(BuildContext context) {
    return BaseLocationPage<Selectable>(
      unfocusSearchField: unfocusSearchField,
      selectText: LocaleKeys.countryListPageSelectCountry.tr(),
      searchFieldLable: LocaleKeys.countryListPageCountry.tr(),
      value: value,
      search: search,
      clear: clear,
      child: BlocBuilder<CountryBloc, CountryState>(
        builder: (BuildContext context, CountryState state) {
          return InteractiveList<Selectable>(
            status: state.status,
            error: state.error,
            list: state.countryList?.list ?? [],
            listView: ListView.separated(
              controller: scrollController,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final item = state.countryList?.list[index];
                return item == null
                    ? const SizedBox()
                    : ListItem(
                        key: ValueKey(item.id),
                        select: select,
                        isActive:
                            item.id == value?.id && item.name == value?.name,
                        item: item,
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemCount: state.countryList?.list.length ?? 0,
            ),
          );
        },
      ),
    );
  }

  @override
  void Function({String? searchText}) get load => ({String? searchText}) =>
      context.read<CountryBloc>().add(CountryLoadEvent(searchText: searchText));
}
