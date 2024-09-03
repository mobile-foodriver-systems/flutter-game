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
    _bloc.add(RatingInitEvent(
      sort: _bloc.state.sort,
      userId: widget.userId,
      initializedCallback: () async {
        _bloc.add(RatingLoadEvent(
          sort: _bloc.state.sort,
          direction: Direction.down,
        ));
        _bloc.add(RatingLoadEvent(
          sort: _bloc.state.sort,
          direction: Direction.up,
        ));
      },
    ));
    super.initState();
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
        direction: direction,
        sort: _bloc.state.sort,
      ),
    );
  }
}
