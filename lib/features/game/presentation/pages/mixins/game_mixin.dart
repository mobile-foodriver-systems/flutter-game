part of 'package:food_driver/features/game/presentation/pages/game_page.dart';

mixin GameMixin on State<GamePageBody> {
  late final GameBloc _gameBloc = context.read<GameBloc>();
  late final UserBloc _userBloc = context.read<UserBloc>();

  @override
  void initState() {
    super.initState();
    _initGame();
  }

  Future<void> loadDriverRoutes({required City city}) async {
    _gameBloc.add(GamePrepareInfoEvent(city));
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
      loadDriverRoutes(city: widget.user.city!);
      return;
    }
    await tryGetCity();
  }

  Future<void> tryGetCity() async {
    final Position? position = await _determineLocation();

    if (position != null) {
      final latLng = LatLng(position.latitude, position.longitude);
      _userBloc.add(UserUpdateLatLngEvent(
        latLng: latLng,
      ));
      _gameBloc.add(GetCityEvent(
        latLng: latLng,
        updateCity: (city) => _userBloc.add(UserUpdateEvent(city: city)),
      ));
      return;
    }

    if (!mounted) {
      return;
    }
    City? city;
    final country = await showSelectDialog<Country>(
      context,
      child: const CountryListPage(),
    );
    if (country != null && mounted) {
      city = await showSelectDialog<City>(
        context,
        child: CityListPage(countryId: country.id),
      );
    }
    if (city != null) {
      _userBloc.add(UserUpdateEvent(city: city));
      loadDriverRoutes(city: city);
      return;
    }
    _gameBloc.add(const GameNoCityEvent());
  }

  Future<Position?> _determineLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return null;
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
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return null;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<T?> showSelectDialog<T>(
    BuildContext context, {
    required Widget child,
  }) async {
    return await showDialog<T>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.62,
            width: MediaQuery.sizeOf(context).width,
            child: child,
          ),
          contentPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.symmetric(horizontal: 36.0),
        );
      },
    );
  }
}
