import 'package:food_driver/features/location/data/models/selectable.dart';

abstract class ApiList<T extends Selectable> {
  final int? count;
  final int limit;
  int? offset;
  List<T> list;

  ApiList({
    this.count,
    this.limit = 20,
    this.offset,
    this.list = const [],
  });
}
