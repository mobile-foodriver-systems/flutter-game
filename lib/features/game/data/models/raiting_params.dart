import 'package:food_driver/features/location/data/models/list_params.dart';

class RaitingParams extends ListParams {
  final int? radiusInKm;

  RaitingParams({
    this.radiusInKm,
    super.limit = 20,
    super.offset,
  });
}
