part of 'package:food_driver/features/location/presentation/pages/country_list_page.dart';

mixin CountryMixin on State<CountryBody> {
  final _scrollController = ScrollController();
  late final _bloc = context.read<CountryBloc>();
  Selectable? country;

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

  Future search() async {}

  Future clear() async {}

  void select(Selectable value) {
    setState(() {
      country = value;
    });
  }

  void _onScroll() {
    if (_isBottom) _bloc.add(const CountryLoadEvent());
  }
}
