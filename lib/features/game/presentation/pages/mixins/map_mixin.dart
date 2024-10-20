part of 'package:food_driver/features/game/presentation/widgets/game_map.dart';

mixin MapMixin on State<GameMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final screenRect = Rect.fromPoints(
      Offset.zero,
      PlatformDispatcher.instance.views.first.physicalSize
          .bottomRight(Offset.zero));
  late final GameBloc _bloc = context.read<GameBloc>();

  GoogleMapController? googleMapController;
  late CameraPosition _cameraPosition;
  Set<Marker> _markers = {};
  List<Offset> _outsideMarkers = [];
  Offset screenCenter = Offset.zero;

  @override
  void initState() {
    _cameraPosition = widget.cameraPosition;
    _markers = widget.markers;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant GameMap oldWidget) {
    if (_markers != widget.markers) {
      _markers = widget.markers;
      _updateArrows();
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<void> _updateArrows() async {
    if (googleMapController == null ||
        widget.type != GameStateType.initialized) {
      return;
    }
    final screemCoordinate =
        await googleMapController!.getScreenCoordinate(_cameraPosition.target);
    screenCenter = Offset(
      screemCoordinate.x.toDouble(),
      screemCoordinate.y.toDouble(),
    );

    // print('screenCenter: $screenCenter');

    final newMarkers = <Offset>[];
    try {
      for (var marker in _markers) {
        final screemCoordinate =
            await googleMapController!.getScreenCoordinate(marker.position);
        final offset = Offset(
          screemCoordinate.x.toDouble(),
          screemCoordinate.y.toDouble(),
        );
        if (!screenRect.contains(offset)) newMarkers.add(offset);
      }

      // Обновляем список стрелок и запускаем анимацию
      if (mounted) {
        setState(() {
          _outsideMarkers = newMarkers;
        });
      }
    } catch (_) {}
  }

  void listener(BuildContext context, GameState state) async {
    final cameraPosition = state.maybeMap(
      orElse: () => null,
      game: (game) => game.cameraPosition,
      initialized: (initialized) => initialized.cameraPosition,
    );
    if (cameraPosition?.target != widget.cameraPosition.target &&
        googleMapController != null &&
        cameraPosition != null) {
      googleMapController!
          .moveCamera(CameraUpdate.newLatLng(cameraPosition.target));
    }
  }

  void onMapCreated(GoogleMapController controller) {
    if (mounted) {
      _controller.complete(controller);
      googleMapController = controller;
      // Изначальное обновление стрелок после создания карты
      if (mounted) {
        _updateArrows();
      }
    }
  }

  void onCameraMove(CameraPosition position) async {
    _cameraPosition = position;
    _updateArrows();
  }

  void onCameraIdle() {
    // Дополнительное обновление при остановке камеры
    if (googleMapController != null) {
      _updateArrows();
    }
  }

  void onMarkerTap(int routeId) {
    _bloc.add(GameStartEvent(routeId));
  }

  @override
  void dispose() {
    googleMapController?.dispose();
    super.dispose();
  }
}
