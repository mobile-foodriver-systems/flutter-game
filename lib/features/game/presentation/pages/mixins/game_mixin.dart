part of 'package:food_driver/features/game/presentation/pages/game_page.dart';

mixin GameMixin on State<GamePageBody> {
  late final GameBloc _gameBloc = context.read<GameBloc>();
  late final UserBloc _userBloc = context.read<UserBloc>();

  @override
  void initState() {
    super.initState();
    _initGame();
  }

  Future<void> loadDriverRoutes({required int cityId}) async {
    _gameBloc.add(GamePrepareInfoEvent(cityId));
  }

  void toggleToInit() {
    _gameBloc.add(const GameInitializedEvent());
  }

  void toggleToPlay() {
    _gameBloc.add(const GamePlayEvent());
  }

  void onTap() {
    if (_gameBloc.state.status == GameStateType.playing) {
      _gameBloc.add(const GameTapEvent());
    }
  }

  void breakGame() {
    _gameBloc.add(const GameBreakEvent());
  }

  Future<void> _initGame() async {
    if (widget.user.city != null) {
      loadDriverRoutes(cityId: widget.user.city!.id);
      return;
    }
    try {
      final Position position = await _determinePosition();
      final latLng = LatLng(position.latitude, position.longitude);
      _userBloc.add(UserUpdateLatLngEvent(
        latLng: latLng,
        userId: widget.user.id,
      ));
      _gameBloc.add(GetCityEvent(latLng: latLng));
    } catch (e) {
      if (mounted) {
        final country = await showCountryDialog(context);
      }
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<Country?> showCountryDialog(BuildContext context) async {
    return await showDialog<Country>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.62,
            width: MediaQuery.sizeOf(context).width,
            child: const CountryListPage(),
          ),
          contentPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.symmetric(horizontal: 36.0),
        );
      },
    );
  }
}
