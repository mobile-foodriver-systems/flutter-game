part of 'package:food_driver/features/game/presentation/widgets/users_list.dart';

mixin RatingMixin on State<UsersList> {
  late final RatingBloc _bloc = context.read<RatingBloc>();

  late final ScrollController _scrollController = ScrollController(
    initialScrollOffset: -50,
  );

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

  void _onLoadMore(Direction direction) {
    _bloc.add(
      RatingLoadEvent(
        direction: direction,
        sort: _bloc.state.sort,
      ),
    );
  }
}
