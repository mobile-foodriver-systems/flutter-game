import 'package:food_driver/features/location/data/models/list_params.dart';

class CountryParams extends ListParams {
  CountryParams({
    super.limit = 300,
    super.offset,
    super.searchText,
  });
}
