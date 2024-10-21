part of '../../ml_card_scanner.dart';

class CameraWidget extends StatefulWidget {
  final CameraController cameraController;
  final CameraDescription cameraDescription;
  final int scannerDelay;
  final CameraPreviewBuilder? cameraPreviewBuilder;
  final void Function(InputImage inputImage) onImage;

  const CameraWidget({
    required this.cameraController,
    required this.cameraDescription,
    required this.onImage,
    required this.scannerDelay,
    this.cameraPreviewBuilder,
    super.key,
  });

  @override
  CameraViewState createState() => CameraViewState();
}

class CameraViewState extends State<CameraWidget> {
  final _orientations = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };
  int _lastFrameDecode = 0;

  Future<void> stopCameraStream() async {
    if (!widget.cameraController.value.isStreamingImages) {
      return;
    }
    return widget.cameraController.stopImageStream();
  }

  Future<void> startCameraStream() async {
    if (widget.cameraController.value.isStreamingImages) {
      return;
    }
    return widget.cameraController.startImageStream(_processCameraImage);
  }

  @override
  void initState() {
    super.initState();
    startCameraStream();
  }

  @override
  void dispose() {
    widget.cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.sizeOf(context);
    final scale =
        1 / (widget.cameraController.value.aspectRatio * mediaSize.aspectRatio);

    return ClipRect(
      clipper: _MediaSizeClipper(mediaSize),
      child: Transform.scale(
        scale: scale,
        alignment: Alignment.topCenter,
        child: CameraPreview(widget.cameraController),
      ),
    );
  }

  Future<void> _processCameraImage(CameraImage image) async {
    if ((DateTime.now().millisecondsSinceEpoch - _lastFrameDecode) <
        widget.scannerDelay) {
      return;
    }
    _lastFrameDecode = DateTime.now().millisecondsSinceEpoch;

    final sensorOrientation = widget.cameraDescription.sensorOrientation;
    InputImageRotation? rotation;
    if (Platform.isIOS) {
      rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
    } else if (Platform.isAndroid) {
      var rotationCompensation =
          _orientations[widget.cameraController.value.deviceOrientation];
      if (rotationCompensation == null) {
        return;
      }
      if (widget.cameraDescription.lensDirection == CameraLensDirection.front) {
        rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
      } else {
        rotationCompensation =
            (sensorOrientation - rotationCompensation + 360) % 360;
      }
      rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
    }

    if (rotation == null) {
      return;
    }

    final format = InputImageFormatValue.fromRawValue(image.format.raw);

    if (image.planes.isEmpty) {
      return;
    }
    final plane = image.planes.first;
    final inputImage = InputImage.fromBytes(
      bytes: image.planes.first.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation,
        format: format ?? InputImageFormat.yuv420,
        bytesPerRow: plane.bytesPerRow,
      ),
    );

    widget.onImage(inputImage);
  }
}

class _MediaSizeClipper extends CustomClipper<Rect> {
  final Size mediaSize;
  const _MediaSizeClipper(this.mediaSize);
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, mediaSize.width, mediaSize.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
