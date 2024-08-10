import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/localization/data/models/supported_locales.dart';
import 'package:food_driver/features/localization/domain/repositories/localization_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class LoadLocalizationUseCase implements UseCase<SupportedLocales, NoParams> {
  final LocalizationRepository _localizationRepository;
  LoadLocalizationUseCase(this._localizationRepository);

  @override
  Future<Either<Failure, SupportedLocales>> call(NoParams _) async {
    return await _localizationRepository.getSupportedLocales();
  }
}
