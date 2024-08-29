part of 'package:food_driver/features/game/presentation/widgets/game_map.dart';

mixin MapMixin on State<GameMap> {
  Completer<GoogleMapController> get _controller;
  GoogleMapController? googleMapController;

  late final GameBloc _bloc = context.read<GameBloc>();

  // LatLng findInitPosition(LatLng defaultPosition) {
  //   final anyCoordinates = widget.routes
  //       .firstWhereOrNull((route) => route.coordinatesList.isNotEmpty)
  //       ?.coordinatesList
  //       .firstWhereOrNull((latLng) => latLng != null);
  //   if (anyCoordinates == null) {
  //     return defaultPosition;
  //   }
  //   return LatLng(anyCoordinates.latitude, anyCoordinates.longitude);
  // }

  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    googleMapController = controller;
  }

  // void moveCamera(LatLng position) async {
  //   final controller = await _controller.future;
  //   controller.moveCamera(CameraUpdate.newLatLng(position));
  // }

  void onMarkerTap(int routeId) {
    _bloc.add(GameStartEvent(routeId));
  }

  // void onCameraMove(CameraPosition position) {
  //   var newPosition = widget.markers
  //       .firstWhereOrNull((marker) =>
  //           marker.markerId.value == MarkerType.driver.value.toString())
  //       ?.position;
  //   if (newPosition == null ||
  //       target.latitude == newPosition.latitude &&
  //           target.longitude == newPosition.longitude) return;
  //   target = newPosition;
  //   setState(() {});
  // }

  @override
  void dispose() {
    googleMapController?.dispose();
    super.dispose();
  }
}
