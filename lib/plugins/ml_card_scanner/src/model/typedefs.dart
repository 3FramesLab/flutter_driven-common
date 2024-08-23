part of '../../ml_card_scanner.dart';

typedef CameraPreviewBuilder = Widget Function(
  BuildContext context,
  CameraPreviewWrapper preview,
  Size? previewSize,
);

typedef OverlayTextBuilder = Widget Function(BuildContext context);

typedef OverlayBuilder = Widget Function(BuildContext context);
