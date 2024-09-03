part of 'package:food_driver/features/game/presentation/widgets/users_list.dart';

mixin RatingMixin on State<UsersList> {
  late final RatingBloc _bloc = context.read<RatingBloc>();
  final _scrollController = ScrollController();

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void initState() {
    super.initState();
    _bloc.add(RatingInitEvent(
      userId: widget.userId,
      initializedCallback: () => _bloc.add(const RatingLoadEvent()),
    ));
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      _bloc.add(RatingLoadEvent(sort: _bloc.state.sort));
    }
  }

  void _onLoadMore(Direction direction) {
    _bloc.add(
      RatingLoadEvent(
        userId: widget.userId,
        direction: direction,
      ),
    );
  }
}
