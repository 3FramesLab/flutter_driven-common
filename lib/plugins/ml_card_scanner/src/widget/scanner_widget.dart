part of '../../ml_card_scanner.dart';

class ScannerWidget extends StatefulWidget {
  final CardOrientation overlayOrientation;
  final OverlayBuilder? overlayBuilder;
  final int scannerDelay;
  final bool oneShotScanning;
  final CameraResolution cameraResolution;
  final ScannerWidgetController? controller;
  final CameraPreviewBuilder? cameraPreviewBuilder;
  final OverlayTextBuilder? overlayTextBuilder;

  const ScannerWidget({
    this.overlayBuilder,
    this.controller,
    this.scannerDelay = 400,
    this.oneShotScanning = true,
    this.overlayOrientation = CardOrientation.portrait,
    this.cameraResolution = CameraResolution.high,
    this.cameraPreviewBuilder,
    this.overlayTextBuilder,
    super.key,
  });

  @override
  State<ScannerWidget> createState() => _ScannerWidgetState();
}

class _ScannerWidgetState extends State<ScannerWidget>
    with WidgetsBindingObserver {
  final CardParserUtil _cardParser = CardParserUtil();
  final GlobalKey<CameraViewState> _cameraKey = GlobalKey();
  final ValueNotifier<bool> _isCameraInitialized = ValueNotifier(false);
  bool cardListenerInvoked = false;

  late CameraDescription _camera;
  late ScannerWidgetController _scannerController;
  CameraController? _cameraController;
  bool cameraPreviewEnabled = true;
  bool scanningEnabled = true;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      WidgetsBinding.instance.addObserver(this);
      _scannerController = widget.controller ?? ScannerWidgetController();
      _scannerController.addListener(_scanParamsListener);
      _initialize();
    }
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    try {
      if (!(_cameraController?.value.isInitialized ?? false)) {
        return;
      }

      if (state == AppLifecycleState.inactive) {
        await _cameraKey.currentState?.stopCameraStream();
      } else if (state == AppLifecycleState.resumed) {
        await _cameraKey.currentState?.startCameraStream();
      }
    } catch (e) {
      _handleError(ScannerException(e.toString()));
    }
  }

  @override
  void dispose() {
    if (mounted) {
      WidgetsBinding.instance.removeObserver(this);
      _cameraKey.currentState?.stopCameraStream();
      _scannerController.removeListener(_scanParamsListener);
      _cameraController?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ValueListenableBuilder<bool>(
          valueListenable: _isCameraInitialized,
          builder: (context, cameraInitialized, _) {
            final controller = _cameraController;

            if (controller == null) {
              return const SizedBox.shrink();
            }

            if (cameraInitialized) {
              return CameraWidget(
                key: _cameraKey,
                cameraController: controller,
                cameraDescription: _camera,
                onImage: _detect,
                scannerDelay: widget.scannerDelay,
                cameraPreviewBuilder: widget.cameraPreviewBuilder,
              );
            }

            return const SizedBox.shrink();
          },
        ),
        widget.overlayBuilder?.call(context) ??
            CameraOverlayWidget(
              cardOrientation: widget.overlayOrientation,
              overlayBorderRadius: 25,
              overlayColorFilter: const Color.fromRGBO(0, 0, 0, 80),
            ),
      ],
    );
  }

  Future<void> _initialize() async {
    try {
      final initializeResult = await _initializeCamera();
      if (initializeResult) {
        _isCameraInitialized.value = initializeResult;
      }
    } catch (e) {
      _handleError(ScannerException(e.toString()));
    }
  }

  Future<bool> _initializeCamera() async {
    final status = await Permission.camera.isGranted;
    if (!status) {
      _handleError(const ScannerPermissionIsNotGrantedException());
      return false;
    }

    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      _handleError(const ScannerNoCamerasAvailableException());
      return false;
    }
    if (cameras
        .where((cam) => cam.lensDirection == CameraLensDirection.back)
        .isEmpty) {
      _handleError(const ScannerNoBackCameraAvailableException());
      return false;
    }
    _camera = cameras
        .firstWhere((cam) => cam.lensDirection == CameraLensDirection.back);
    _cameraController = CameraController(
      _camera,
      _getResolutionPreset(),
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.nv21
          : ImageFormatGroup.bgra8888,
    );
    await _cameraController?.initialize();
    return true;
  }

  ResolutionPreset _getResolutionPreset() {
    switch (widget.cameraResolution) {
      case CameraResolution.max:
        return ResolutionPreset.max;
      case CameraResolution.high:
        return ResolutionPreset.veryHigh;
      case CameraResolution.ultra:
        return ResolutionPreset.ultraHigh;
    }
  }

  Future<void> _detect(InputImage image) async {
    debugPrint(
        'debug-print: in _detect() cardListenerInvoked = $cardListenerInvoked , cameraPreviewEnabled = $cameraPreviewEnabled');

    if (cardListenerInvoked || !cameraPreviewEnabled || !scanningEnabled) {
      return;
    }
    cardListenerInvoked = true;
    final resultCard = await _cardParser.detectCardContent(image);
    debugPrint('debug-print: Detect Card Details: ${resultCard.toString()}');

    if (resultCard != null) {
      debugPrint('debug-print: invoke the listener');
      if (widget.oneShotScanning) {
        _scannerController.disableScanning();
      }
      _handleData(resultCard);
    }
    cardListenerInvoked = false;
    debugPrint(
        'debug-print: out _detect() cardListenerInvoked = $cardListenerInvoked');
  }

  void _scanParamsListener() {
    debugPrint(
        'debug-print: in _scanParamsListener() scanningEnabled = ${_scannerController.scanningEnabled}');
    if (_scannerController.scanningEnabled) {
      scanningEnabled = true;
      _cameraKey.currentState?.startCameraStream();
    } else {
      scanningEnabled = false;
      _cameraKey.currentState?.stopCameraStream();
    }
    if (_scannerController.cameraPreviewEnabled) {
      cameraPreviewEnabled = true;
      _cameraController?.resumePreview();
    } else {
      cameraPreviewEnabled = false;
      _cameraController?.pausePreview();
    }
  }

  void _handleData(CardInfo cardInfo) {
    final cardScannedCallback = _scannerController.onCardScanned;
    cardScannedCallback?.call(cardInfo);
  }

  void _handleError(ScannerException exception) {
    final errorCallback = _scannerController.onError;
    errorCallback?.call(exception);
  }
}
