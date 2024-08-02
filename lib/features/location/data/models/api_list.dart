abstract class ApiList<T> {
  final int? count;
  final int? limit;
  final int? offset;
  final List<T> list;

  ApiList({
    this.count,
    this.limit,
    this.offset,
    this.list = const [],
  });
}
