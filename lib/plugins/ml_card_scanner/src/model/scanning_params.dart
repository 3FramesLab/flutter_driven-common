part of '../../ml_card_scanner.dart';

class ScanningParams {
  final bool scanningEnabled;
  final bool cameraPreviewEnabled;
  final ValueChanged<CardInfo>? onCardScanned;
  final ValueChanged<ScannerException>? onError;

  const ScanningParams({
    required this.scanningEnabled,
    required this.cameraPreviewEnabled,
    required this.onCardScanned,
    required this.onError,
  });

  factory ScanningParams.defaultParams() => const ScanningParams(
        scanningEnabled: true,
        cameraPreviewEnabled: true,
        onCardScanned: null,
        onError: null,
      );

  ScanningParams copyWith({
    bool? scanningEnabled,
    bool? cameraPreviewEnabled,
    ValueChanged<CardInfo?>? onCardScanned,
    ValueChanged<ScannerException>? onError,
  }) =>
      ScanningParams(
        scanningEnabled: scanningEnabled ?? this.scanningEnabled,
        onCardScanned: onCardScanned ?? this.onCardScanned,
        cameraPreviewEnabled: cameraPreviewEnabled ?? this.cameraPreviewEnabled,
        onError: onError ?? this.onError,
      );
}
