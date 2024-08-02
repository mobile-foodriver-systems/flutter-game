import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/location/presentation/bloc/city/city_bloc.dart';

part 'package:food_driver/features/location/presentation/pages/mixins/city_mixin.dart';

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

class _CityBodyState extends State<CityBody> with CityMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
      builder: (BuildContext context, CityState state) {
        return const Scaffold(
          body: SafeArea(
            child: SizedBox(),
          ),
        );
      },
    );
  }
}
