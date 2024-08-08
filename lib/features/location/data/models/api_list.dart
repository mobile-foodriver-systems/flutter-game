abstract class ApiList<T> {
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
