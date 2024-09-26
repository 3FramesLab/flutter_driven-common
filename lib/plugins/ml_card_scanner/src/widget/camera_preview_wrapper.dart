part of '../../ml_card_scanner.dart';

class CameraPreviewWrapper extends StatelessWidget {
  const CameraPreviewWrapper({
    required CameraController cameraController,
    super.key,
  }) : _cameraController = cameraController;

  final CameraController _cameraController;

  @override
  Widget build(BuildContext context) => CameraPreview(_cameraController);
}
