part of 'package:food_driver/features/game/presentation/widgets/users_list.dart';

mixin RaitingMixin on State<UsersList> {
  late final RaitingBloc _bloc = context.read<RaitingBloc>();
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
    _bloc.add(const RaitingLoadEvent());
    _scrollController.addListener(_onScroll);
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
      _bloc.add(RaitingLoadEvent(sort: _bloc.state.sort));
    }
  }
}
