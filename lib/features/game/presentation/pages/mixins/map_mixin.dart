part of 'package:food_driver/features/game/presentation/widgets/game_map.dart';

mixin MapMixin on State<GameMap> {
  Completer<GoogleMapController> get _controller;
  late final GameBloc _bloc = context.read<GameBloc>();

  // Set<Marker> markers = {};
  // Set<Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    createMarkers();
  }

  LatLng findInitPosition(LatLng defaultPosition) {
    final anyCoordinates = widget.routes
        .firstWhereOrNull((route) => route.coordinatesList.isNotEmpty)
        ?.coordinatesList
        .firstWhereOrNull((latLng) => latLng != null);
    if (anyCoordinates == null) {
      return defaultPosition;
    }
    return LatLng(anyCoordinates.latitude, anyCoordinates.longitude);
  }

  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Future<void> createMarkers() async {
    _bloc.add(GameAddMarkersEvent(await RouteMarker.createMarkers(
      routes: widget.routes,
      onTap: (route) => onMarkerTap(route),
    )));
  }

  void onMarkerTap(DriveRouteEntity route) {
    _bloc.add(GameStartEvent(route));
  }
}
