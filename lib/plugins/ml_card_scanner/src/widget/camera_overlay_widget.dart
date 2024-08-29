part of '../../ml_card_scanner.dart';

class CameraOverlayWidget extends StatelessWidget {
  final CardOrientation cardOrientation;
  final double overlayBorderRadius;
  final Color overlayColorFilter;
  final DetermineTopIcon topIcon;
  final bool showInnerBorder;

  const CameraOverlayWidget({
    required this.cardOrientation,
    required this.overlayBorderRadius,
    required this.overlayColorFilter,
    this.topIcon = DetermineTopIcon.nothing,
    this.showInnerBorder = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Stack(
      children: [
        topIconView(),
        Container(
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
              cornerBorderColor: getIconColor(),
              showInnerBorder: showInnerBorder,
            ),
          ),
        ),
      ],
    );
  }

  Widget topIconView() {
    return Positioned.fill(
      top: 230,
      child: Align(
        alignment: Alignment.topCenter,
        child: Icon(
          getIcon(),
          size: 40,
          color: getIconColor(),
        ),
      ),
    );
  }

  IconData? getIcon() {
    switch (topIcon) {
      case DetermineTopIcon.success:
        return Icons.check_circle;
      case DetermineTopIcon.failure:
        return Icons.cancel;
      case DetermineTopIcon.nothing:
        return null;
    }
  }

  Color getIconColor() {
    switch (topIcon) {
      case DetermineTopIcon.success:
        return DrivenColors.scanSuccessGreen;
      case DetermineTopIcon.failure:
        return DrivenColors.scanFailureRed;
      case DetermineTopIcon.nothing:
        return Colors.white;
    }
  }
}

enum DetermineTopIcon { success, failure, nothing }
