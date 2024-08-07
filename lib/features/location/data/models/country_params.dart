import 'package:food_driver/features/location/data/models/list_params.dart';

class CountryParams extends ListParams {
  CountryParams({
    super.limit = 20,
    super.offset,
    super.searchText,
  });
}
