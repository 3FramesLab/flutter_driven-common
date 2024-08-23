part of '../../ml_card_scanner.dart';

class CameraOverlayWidget extends StatelessWidget {
  final CardOrientation cardOrientation;
  final double overlayBorderRadius;
  final Color overlayColorFilter;

  const CameraOverlayWidget({
    required this.cardOrientation,
    required this.overlayBorderRadius,
    required this.overlayColorFilter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      decoration: ShapeDecoration(
        shape: ScannerOverlayShape(
          cutOutHeight: cardOrientation == CardOrientation.portrait
              ? (size.width * 0.75) * 1.6
              : (size.width * 0.95) / 1.8,
          cutOutWidth: cardOrientation == CardOrientation.portrait
              ? size.width * 0.75
              : size.width * 0.8,
          overlayColor: const Color.fromRGBO(0, 0, 0, 80),
          radius: const Radius.circular(0),
        ),
      ),
    );
  }
}
