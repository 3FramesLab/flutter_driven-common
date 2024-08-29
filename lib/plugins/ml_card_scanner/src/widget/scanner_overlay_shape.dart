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
    this.showInnerBorder = false,
  });

  final Color overlayColor;
  final double cutOutWidth;
  final double cutOutHeight;
  final Radius radius;
  final double borderLength;
  final double strokeWidth;
  final Color cornerBorderColor;
  final bool showInnerBorder;

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
    paintBorder(
      canvas,
      rect,
      cutOutRect,
      cutOutPaint,
      backgroundPaint,
      8,
    );
    if (showInnerBorder) {
      paintBorder(
        canvas,
        rect,
        cutOutRect,
        cutOutPaint,
        backgroundPaint,
        2,
        isInnerBorder: true,
      );
    }
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

  void paintBorder(
    Canvas canvas,
    Rect rect,
    Rect cutOutRect,
    Paint cutOutPaint,
    Paint backgroundPaint,
    double padding, {
    bool isInnerBorder = false,
  }) {
    final cornerBorder = Paint()
      ..color = cornerBorderColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..strokeWidth = strokeWidth;

    final minimumSide = min(cutOutHeight, cutOutWidth);

    final mBorderLength = borderLength > minimumSide / 2 + strokeWidth * 2
        ? minimumSide * 2
        : borderLength;

    final topLeftWithPadding = cutOutRect.topLeft + Offset(-padding, -padding);
    final topRightWithPadding = cutOutRect.topRight + Offset(padding, -padding);
    final bottomLeftWithPadding =
        cutOutRect.bottomLeft + Offset(-padding, padding);
    final bottomRightWithPadding =
        cutOutRect.bottomRight + Offset(padding, padding);

    final innerShapBackgroundPaint = Paint()..color = Colors.transparent;

    canvas
      ..saveLayer(rect, backgroundPaint)
      ..drawRect(
          rect, isInnerBorder ? innerShapBackgroundPaint : backgroundPaint)
      ..drawRRect(RRect.fromRectAndRadius(cutOutRect, radius), cutOutPaint)
      // topLeftVertical
      ..drawLine(
          topLeftWithPadding,
          Offset(
              topLeftWithPadding.dx,
              isInnerBorder
                  ? topLeftWithPadding.dy + 200
                  : topLeftWithPadding.dy + mBorderLength),
          cornerBorder)
      // topLeftHorizontal
      ..drawLine(
          topLeftWithPadding,
          Offset(
              isInnerBorder
                  ? topLeftWithPadding.dx + 300
                  : topLeftWithPadding.dx + mBorderLength,
              topLeftWithPadding.dy),
          cornerBorder)
      // topRightVertical
      ..drawLine(
          topRightWithPadding,
          Offset(
              topRightWithPadding.dx,
              isInnerBorder
                  ? topRightWithPadding.dy + 200
                  : topRightWithPadding.dy + mBorderLength),
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
          Offset(
              isInnerBorder
                  ? bottomLeftWithPadding.dx + 300
                  : bottomLeftWithPadding.dx + mBorderLength,
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
          cornerBorder)
      ..restore();
  }
}
