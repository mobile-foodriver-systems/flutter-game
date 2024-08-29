import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/localization/data/datasources/local/localization_local_data_source.dart';
import 'package:food_driver/features/localization/data/models/supported_locales.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class CacheLocalizationUseCase implements UseCase<bool, SupportedLocales> {
  final LocalizationLocalDataSource _localizationLocalRepository;

  CacheLocalizationUseCase(this._localizationLocalRepository);

  @override
  Future<Either<Failure, bool>> call(SupportedLocales locales) async {
    await _localizationLocalRepository.cacheLocales(locales);
    return const Right(true);
  }
}
