import 'package:food_driver/features/location/data/models/list_params.dart';

class RatingParams extends ListParams {
  final int? radiusInKm;

  RatingParams({
    this.radiusInKm,
    super.limit = 20,
    super.offset,
  });
}
