import 'package:food_driver/features/location/data/models/list_params.dart';

class RatingParams extends ListParams {
  final int? radiusInKm;
  final double? longitude;
  final double? latitude;

  RatingParams({
    this.radiusInKm,
    this.longitude,
    this.latitude,
    super.limit = 20,
    super.offset,
  });
}
