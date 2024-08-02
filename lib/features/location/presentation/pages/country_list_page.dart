import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/location/presentation/bloc/country/country_bloc.dart';

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

class _CountryBodyState extends State<CountryBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryBloc, CountryState>(
      builder: (BuildContext context, CountryState state) {
        return const Scaffold(
          body: SafeArea(
            child: SizedBox(),
          ),
        );
      },
    );
  }
}
