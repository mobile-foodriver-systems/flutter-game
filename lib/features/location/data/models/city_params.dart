import 'package:food_driver/features/location/data/models/list_params.dart';

class CityParams extends ListParams {
  CityParams({
    required this.countryId,
    super.limit = 20,
    super.offset,
    super.searchText,
  });

  final int countryId;
}
