import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/exceptions/exception_to_failure_converter.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/localization/data/datasources/local/localization_local_data_source.dart';
import 'package:food_driver/features/localization/data/models/supported_locales.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class GetCachedLocalizationUseCase
    implements UseCase<SupportedLocales?, NoParams> {
  final LocalizationLocalDataSource _localizationLocalRepository;

  GetCachedLocalizationUseCase(this._localizationLocalRepository);

  @override
  Future<Either<Failure, SupportedLocales?>> call(NoParams _) async {
    try {
      final locales = await _localizationLocalRepository.getSupportedLocales();
      return Right(locales);
    } catch (e, s) {
      return Left(ExceptionToFailureConverter.convert(e, s));
    }
  }
}
