part of 'package:food_driver/features/game/presentation/pages/game_page.dart';

mixin GameMixin on State<GamePageBody> {
  late final GameBloc _bloc = context.read<GameBloc>();

  @override
  void initState() {
    super.initState();
    loadDriverRoutes();
  }

  Future<void> loadDriverRoutes() async {
    _bloc.add(const GamePrepareInfoEvent(1));
  }

  void toggleToInit() {
    _bloc.add(const GameInitializedEvent()); 
  }

  void toggleToPlay() {
    _bloc.add(const GameChangeStateTypeEvent(GameStateType.playing));
  }

  void onTap() {
    if (_bloc.state.status != GameStateType.playing) {
      return;
    }
  }

  void breakGame() {
    _bloc.add(const GameBreakEvent());
  }
}
