import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/exceptions/exception_to_failure_converter.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/localization/data/datasources/local/localization_local_data_source.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class ChangeLanguageUseCase implements UseCase<bool, Locale> {
  final LocalizationLocalDataSource _localizationLocalRepository;

  ChangeLanguageUseCase(this._localizationLocalRepository);

  @override
  Future<Either<Failure, bool>> call(Locale locale) async {
    try {
      await _localizationLocalRepository.cacheLocaleLanguage(
        locale,
      );
      return const Right(true);
    } catch (e, s) {
      return Left(ExceptionToFailureConverter.convert(e, s));
    }
  }
}
