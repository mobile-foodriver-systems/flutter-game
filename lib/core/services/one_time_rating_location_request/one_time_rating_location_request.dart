import 'package:food_driver/features/location/data/models/city.dart';
import 'package:injectable/injectable.dart';

@singleton
class OneTimeRatingLocationRequest {
  OneTimeRatingLocationRequest();

  City? city;
}
