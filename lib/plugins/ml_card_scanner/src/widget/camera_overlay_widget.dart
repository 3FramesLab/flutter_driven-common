part of '../../ml_card_scanner.dart';

class CameraOverlayWidget extends StatelessWidget {
  final CardOrientation cardOrientation;
  final double overlayBorderRadius;
  final Color overlayColorFilter;
  final Color? innerBoxColor;

  final iconSize = 40;

  const CameraOverlayWidget({
    required this.cardOrientation,
    required this.overlayBorderRadius,
    required this.overlayColorFilter,
    this.innerBoxColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final cutOutHeight = cardOrientation == CardOrientation.portrait
        ? (size.width * 0.75) * 1.6
        : (size.width * 0.95) / 1.8;

    final cutOutWidth = cardOrientation == CardOrientation.portrait
        ? size.width * 0.75
        : size.width * 0.8;

    final iconTopPadding =
        (size.height / 2) - (cutOutHeight / 2) - iconSize - 20;

    return Stack(
      children: [
        Container(
          decoration: ShapeDecoration(
            shape: ScannerOverlayShape(
              cutOutHeight: cutOutHeight,
              cutOutWidth: cutOutWidth,
              overlayColor: const Color.fromRGBO(0, 0, 0, 80),
              radius: const Radius.circular(0),
              innerBoxColor: innerBoxColor,
            ),
          ),
        ),
        if ((innerBoxColor != null))
          Positioned(
            left: 0,
            right: 0,
            top: iconTopPadding,
            child: _icon,
          ),
      ],
    );
  }

  Widget get _icon => Icon(
        innerBoxColor == DrivenColors.successGreenColor
            ? Icons.check_circle
            : Icons.cancel,
        size: 40,
        color: innerBoxColor!,
      );
}
