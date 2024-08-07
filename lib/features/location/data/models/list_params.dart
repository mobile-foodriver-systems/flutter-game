abstract class ListParams {
  final int limit;
  final int? offset;
  final String? searchText;

  ListParams({
    this.limit = 20,
    this.offset,
    this.searchText,
  });
}
