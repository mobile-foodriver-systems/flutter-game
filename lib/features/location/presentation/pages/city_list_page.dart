import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/core/ui/mixins/search_mixin.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/location/data/models/selectable.dart';
import 'package:food_driver/features/location/presentation/bloc/base_location_bloc.dart';
import 'package:food_driver/features/location/presentation/bloc/city/city_bloc.dart';
import 'package:food_driver/features/location/presentation/pages/base_location_page.dart';
import 'package:food_driver/features/location/presentation/widgets/interactive_list.dart';
import 'package:food_driver/features/location/presentation/widgets/list_item.dart';
import 'package:food_driver/generated/l10n.dart';

class CityListPage extends StatelessWidget {
  final int countryId;
  const CityListPage({
    super.key,
    required this.countryId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CityBloc>(),
      child: CityBody(countryId: countryId),
    );
  }
}

class CityBody extends StatefulWidget {
  const CityBody({
    super.key,
    required this.countryId,
  });

  final int countryId;

  @override
  State<CityBody> createState() => _CityBodyState();
}

class _CityBodyState extends State<CityBody> with SearchMixin<CityBody> {
  @override
  Widget build(BuildContext context) {
    return BaseLocationPage<Selectable>(
      unfocusSearchField: unfocusSearchField,
      selectText: S.current.cityListPageSelectCity,
      searchFieldLable: S.current.cityListPageCity,
      value: value,
      search: search,
      clear: clear,
      child: BlocBuilder<CityBloc, BaseLocationState>(
        builder: (BuildContext context, BaseLocationState state) {
          return InteractiveList<Selectable>(
            status: state.status,
            error: state.error,
            list: state.apiList?.list ?? [],
            listView: ListView.separated(
              controller: scrollController,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final item = state.apiList?.list[index];
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
              itemCount: state.apiList?.list.length ?? 0,
            ),
          );
        },
      ),
    );
  }

  @override
  void Function({String? searchText}) get load => ({String? searchText}) =>
      context.read<CityBloc>().add(CityLoadEvent(searchText: searchText));
}
