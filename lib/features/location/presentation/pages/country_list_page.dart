import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/location/data/models/country.dart';
import 'package:food_driver/features/location/data/models/selectable.dart';
import 'package:food_driver/features/location/presentation/bloc/country/country_bloc.dart';
import 'package:food_driver/features/location/presentation/widgets/interactive_list.dart';
import 'package:food_driver/features/location/presentation/widgets/list_item.dart';
import 'package:food_driver/features/location/presentation/widgets/search_text_field.dart';
import 'package:food_driver/generated/l10n.dart';

part 'package:food_driver/features/location/presentation/pages/mixins/country_mixin.dart';

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

class _CountryBodyState extends State<CountryBody> with CountryMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: unfocusSearchField,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              S.current.countryListPageSelectCountry,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 20),
            SearchTextField(
              key: ObjectKey(country),
              value: country,
              label: S.current.countryListPageCountry,
              search: search,
              clear: clear,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<CountryBloc, CountryState>(
                builder: (BuildContext context, CountryState state) {
                  return InteractiveList<Country>(
                    status: state.status,
                    error: state.error,
                    list: state.countryList?.list ?? [],
                    listView: ListView.separated(
                      controller: _scrollController,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        final value = state.countryList?.list[index];
                        return value == null
                            ? const SizedBox()
                            : ListItem(
                                key: ValueKey(value.id),
                                select: select,
                                isActive: value.id == country?.id &&
                                    value.name == country?.name,
                                value: value,
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
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(country),
              child: Text(S.current.countryListPageDone),
            ),
          ],
        ),
      ),
    );
  }
}
