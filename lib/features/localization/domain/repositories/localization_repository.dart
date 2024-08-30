import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/exceptions/exception_to_failure_converter.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/features/localization/data/datasources/remote/localization_remote_data_source.dart';
import 'package:food_driver/features/localization/data/models/phrases_dictionary.dart';
import 'package:food_driver/features/localization/data/models/supported_locales.dart';
import 'package:injectable/injectable.dart';

part 'package:food_driver/features/localization/data/repositories/localization_repository_impl.dart';

abstract class LocalizationRepository {
  Future<Either<Failure, SupportedLocales>> getSupportedLocales();

  Future<Either<Failure, PhrasesDictionary>> getSupportedLocale(String locale);
}
