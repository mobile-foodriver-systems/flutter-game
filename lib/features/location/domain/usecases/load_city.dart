import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/location/data/models/city_list.dart';
import 'package:food_driver/features/location/data/models/city_params.dart';
import 'package:food_driver/features/location/domain/repositories/location_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class LoadCityUseCase implements UseCase<CityList, CityParams> {
  final LocationRepository _locationRepository;
  LoadCityUseCase(this._locationRepository);

  @override
  Future<Either<Failure, CityList>> call(CityParams params) async {
    return await _locationRepository.getCityList(
      countryId: params.countryId,
      searchText: params.searchText,
      limit: params.limit,
      offset: params.offset,
    );
  }
}
