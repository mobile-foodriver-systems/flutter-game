import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/location/data/models/country_list.dart';
import 'package:food_driver/features/location/data/models/country_params.dart';
import 'package:food_driver/features/location/domain/repositories/location_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class LoadCountryUseCase implements UseCase<CountryList, CountryParams> {
  final LocationRepository _locationRepository;
  LoadCountryUseCase(this._locationRepository);

  @override
  Future<Either<Failure, CountryList>> call(CountryParams params) async {
    return await _locationRepository.getCountryList(
      searchText: params.searchText,
      limit: params.limit,
      offset: params.offset,
    );
  }
}
