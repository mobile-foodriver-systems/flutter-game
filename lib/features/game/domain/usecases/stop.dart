import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/game/data/models/drive_route.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class StopUseCase implements UseCase<DriveRoute, NoParams> {
  @override
  Future<Either<Failure, DriveRoute>> call(NoParams _) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
