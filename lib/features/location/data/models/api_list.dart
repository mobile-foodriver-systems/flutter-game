import 'package:food_driver/features/location/data/models/selectable.dart';

class ApiList<T extends Selectable> {
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

  factory ApiList.update({
    required ApiList<T> apiList,
    required List<T> list,
    required int offset,
  }) {
    return ApiList(
      count: apiList.count,
      limit: apiList.limit,
      offset: offset,
      list: [...apiList.list, ...list],
    );
  }
}
