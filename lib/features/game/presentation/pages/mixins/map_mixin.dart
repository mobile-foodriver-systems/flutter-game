part of 'package:food_driver/features/game/presentation/widgets/game_map.dart';

mixin MapMixin on State<GameMap> {
  Completer<GoogleMapController> get _controller;
  late final GameBloc _bloc = context.read<GameBloc>();

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

  void onMarkerTap(int routeId) {
    _bloc.add(GameStartEvent(routeId));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
