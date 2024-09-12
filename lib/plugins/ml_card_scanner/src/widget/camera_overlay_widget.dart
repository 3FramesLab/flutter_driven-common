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

    final cutOutHeight = Utils.getCameraCutoutHeight(context, cardOrientation);

    final cutOutWidth = Utils.getCameraCutoutWidth(context, cardOrientation);

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
