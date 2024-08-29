part of '../../ml_card_scanner.dart';

class ScannerOverlayShape extends ShapeBorder {
  const ScannerOverlayShape({
    required this.cutOutWidth,
    required this.cutOutHeight,
    required this.overlayColor,
    required this.radius,
    this.borderLength = 20,
    this.strokeWidth = 4,
    this.cornerBorderColor = Colors.white,
    this.innerBoxColor,
  });

  final Color overlayColor;
  final double cutOutWidth;
  final double cutOutHeight;
  final Radius radius;
  final double borderLength;
  final double strokeWidth;
  final Color cornerBorderColor;
  final Color? innerBoxColor;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..fillType = PathFillType.evenOdd
      ..addPath(getOuterPath(rect), Offset.zero);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path getLeftTopPath(Rect rect) {
      return Path()
        ..moveTo(rect.left, rect.bottom)
        ..lineTo(rect.left, rect.top)
        ..lineTo(rect.right, rect.top);
    }

    return getLeftTopPath(rect)
      ..lineTo(rect.right, rect.bottom)
      ..lineTo(rect.left, rect.bottom)
      ..lineTo(rect.left, rect.top);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final width = rect.width;
    final height = rect.height;

    final backgroundPaint = Paint()
      ..color = overlayColor
      ..style = PaintingStyle.fill;

    final cutOutPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    final cutOutRect = Rect.fromLTWH(
      rect.left + width / 2 - cutOutWidth / 2,
      rect.top + height / 2 - cutOutHeight / 2,
      cutOutWidth,
      cutOutHeight,
    );

    final cornerBorder = Paint()
      ..color = innerBoxColor != null ? innerBoxColor! : cornerBorderColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..strokeWidth = strokeWidth;

    final minimumSide = min(cutOutHeight, cutOutWidth);

    final mBorderLength = borderLength > minimumSide / 2 + strokeWidth * 2
        ? minimumSide / 2
        : borderLength;

    const padding = 6.0;

    final topLeftWithPadding =
        cutOutRect.topLeft + const Offset(-padding, -padding);
    final topRightWithPadding =
        cutOutRect.topRight + const Offset(padding, -padding);
    final bottomLeftWithPadding =
        cutOutRect.bottomLeft + const Offset(-padding, padding);
    final bottomRightWithPadding =
        cutOutRect.bottomRight + const Offset(padding, padding);

    canvas
      ..saveLayer(rect, backgroundPaint)
      ..drawRect(rect, backgroundPaint)
      ..drawRRect(RRect.fromRectAndRadius(cutOutRect, radius), cutOutPaint)
      // topLeftVertical
      ..drawLine(
          topLeftWithPadding,
          Offset(topLeftWithPadding.dx, topLeftWithPadding.dy + mBorderLength),
          cornerBorder)
      // topLeftHorizontal
      ..drawLine(
          topLeftWithPadding,
          Offset(topLeftWithPadding.dx + mBorderLength, topLeftWithPadding.dy),
          cornerBorder)
      // topRightVertical
      ..drawLine(
          topRightWithPadding,
          Offset(
              topRightWithPadding.dx, topRightWithPadding.dy + mBorderLength),
          cornerBorder)
      // topRightHorizontal
      ..drawLine(
          topRightWithPadding,
          Offset(
              topRightWithPadding.dx - mBorderLength, topRightWithPadding.dy),
          cornerBorder)
      // bottomLeftVertical
      ..drawLine(
          bottomLeftWithPadding,
          Offset(bottomLeftWithPadding.dx,
              bottomLeftWithPadding.dy - mBorderLength),
          cornerBorder)
      // bottomLeftHorizontal
      ..drawLine(
          bottomLeftWithPadding,
          Offset(bottomLeftWithPadding.dx + mBorderLength,
              bottomLeftWithPadding.dy),
          cornerBorder)
      // bottomRightVertical
      ..drawLine(
          bottomRightWithPadding,
          Offset(bottomRightWithPadding.dx,
              bottomRightWithPadding.dy - mBorderLength),
          cornerBorder)
      // bottomRightHorizontal
      ..drawLine(
          bottomRightWithPadding,
          Offset(bottomRightWithPadding.dx - mBorderLength,
              bottomRightWithPadding.dy),
          cornerBorder);

    if (innerBoxColor != null) {
      final innerBoxLine = Paint()
        ..color = innerBoxColor!
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.fill
        ..strokeWidth = 2;

      canvas
        ..drawLine(cutOutRect.bottomLeft, cutOutRect.topLeft, innerBoxLine)
        ..drawLine(cutOutRect.topLeft, cutOutRect.topRight, innerBoxLine)
        ..drawLine(cutOutRect.topRight, cutOutRect.bottomRight, innerBoxLine)
        ..drawLine(cutOutRect.bottomRight, cutOutRect.bottomLeft, innerBoxLine);
    }
    canvas.restore();
  }

  @override
  ShapeBorder scale(double t) {
    return ScannerOverlayShape(
      overlayColor: overlayColor,
      cutOutWidth: cutOutWidth,
      cutOutHeight: cutOutHeight,
      radius: Radius.zero,
    );
  }
}
