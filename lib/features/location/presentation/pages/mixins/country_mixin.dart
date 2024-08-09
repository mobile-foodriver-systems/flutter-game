part of 'package:food_driver/features/location/presentation/pages/country_list_page.dart';

mixin CountryMixin on State<CountryBody> {
  final _scrollController = ScrollController();

  late final _bloc = context.read<CountryBloc>();
  Selectable? country;
  String? searchText;

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void initState() {
    super.initState();
    _bloc.add(const CountryLoadEvent());
    _scrollController.addListener(_onScroll);
  }

  Future search(String searchString) async {
    if (searchString.trim().isEmpty) {
      return;
    }
    searchText = searchString;
    _bloc.add(CountryLoadEvent(searchText: searchText));
  }

  Future clear() async {
    if (searchText?.isNotEmpty ?? false) {
      _bloc.add(const CountryLoadEvent(searchText: null));
    }
    country = null;
    searchText = null;
    setState(() {});
  }

  void select(Selectable value) {
    country = value;
    searchText = null;
    setState(() {});
  }

  void _onScroll() {
    if (_isBottom) {
      _bloc.add(CountryLoadEvent(searchText: searchText));
    }
  }

  void unfocusSearchField() {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
