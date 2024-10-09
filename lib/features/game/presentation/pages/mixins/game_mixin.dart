part of 'package:food_driver/features/game/presentation/pages/game_page.dart';

mixin GameMixin on State<GamePageBody> {
  late final GameBloc _gameBloc = context.read<GameBloc>();
  final UserRepository userRepository = getIt<UserRepository>();
  late final GeolocationService _geolocationService;

  @override
  void initState() {
    _geolocationService = getIt.get<GeolocationService>();
    super.initState();
    _initGame();
  }

  Future<void> loadDriverRoutes({required City city}) async {
    _gameBloc.add(GetRoutesEvent(
      city: city,
      balance: widget.user.balance,
    ));
  }

  void toggleToInit() {
    _gameBloc.add(const GameInitializedEvent());
  }

  void toggleToPlay() {
    _gameBloc.add(const GamePlayEvent());
  }

  void onTap() {
    _gameBloc.state.maybeMap(
      orElse: () => null,
      game: (game) {
        if (game.status == GameStateType.playing) {
          _gameBloc.add(const GameTapEvent());
        }
      },
    );
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
    final Position? position = await _geolocationService.determineLocation();

    if (position != null) {
      final latLng = LatLng(position.latitude, position.longitude);
      userRepository.updateUserLatLng(
        latitude: latLng.latitude,
        longitude: latLng.longitude,
      );
      _gameBloc.add(GetCityEvent(
        latLng: latLng,
        updateCity: (city) => userRepository.updateUser(cityId: city.id),
        balance: widget.user.balance,
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
      userRepository.updateUser(cityId: city.id);
      loadDriverRoutes(city: city);
      return;
    }
    _gameBloc.add(const GameNoCityEvent());
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

  void openRatingList() => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => RatingListPage(userId: widget.user.id),
        ),
      );
}
