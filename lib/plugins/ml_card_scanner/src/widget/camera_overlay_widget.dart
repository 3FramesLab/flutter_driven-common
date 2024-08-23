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

// class _ScannerOverlayShape extends ShapeBorder {
//   const _ScannerOverlayShape({
//     required this.cutOutWidth,
//     required this.cutOutHeight,
//     required this.overlayColor,
//     required this.radius,
//     this.borderLength = 24,
//     this.strokeWidth = 4,
//     this.cornerBorderColor = Colors.white,
//   });

//   final Color overlayColor;
//   final double cutOutWidth;
//   final double cutOutHeight;
//   final Radius radius;
//   final double borderLength;
//   final double strokeWidth;
//   final Color cornerBorderColor;

//   @override
//   EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

//   @override
//   Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
//     return Path()
//       ..fillType = PathFillType.evenOdd
//       ..addPath(getOuterPath(rect), Offset.zero);
//   }

//   @override
//   Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
//     Path getLeftTopPath(Rect rect) {
//       return Path()
//         ..moveTo(rect.left, rect.bottom)
//         ..lineTo(rect.left, rect.top)
//         ..lineTo(rect.right, rect.top);
//     }

//     return getLeftTopPath(rect)
//       ..lineTo(rect.right, rect.bottom)
//       ..lineTo(rect.left, rect.bottom)
//       ..lineTo(rect.left, rect.top);
//   }

//   @override
//   void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
//     final width = rect.width;
//     final height = rect.height;

//     final borderWidthSize = width / 2;

//     final backgroundPaint = Paint()
//       ..color = overlayColor
//       ..style = PaintingStyle.fill;

//     final cutOutPaint = Paint()
//       ..color = Colors.black
//       ..style = PaintingStyle.fill
//       ..blendMode = BlendMode.dstOut;

//     final cutOutRect = Rect.fromLTWH(
//       rect.left + width / 2 - cutOutWidth / 2,
//       rect.top + height / 2 - cutOutHeight / 2,
//       cutOutWidth,
//       cutOutHeight,
//     );

//     final cornerBorder = Paint()
//       ..color = cornerBorderColor
//       ..strokeCap = StrokeCap.round
//       ..style = PaintingStyle.fill
//       ..strokeWidth = strokeWidth;

//     final mBorderLength =
//         borderLength > min(cutOutHeight, cutOutWidth) / 2 + strokeWidth * 2
//             ? borderWidthSize / 2
//             : borderLength;

//     const padding = 5.0;

//     final topLeftWithPadding =
//         cutOutRect.topLeft + const Offset(-padding, -padding);
//     final topRightWithPadding =
//         cutOutRect.topRight + const Offset(padding, -padding);
//     final bottomLeftWithPadding =
//         cutOutRect.bottomLeft + const Offset(-padding, padding);
//     final bottomRightWithPadding =
//         cutOutRect.bottomRight + const Offset(padding, padding);

//     canvas
//       ..saveLayer(rect, backgroundPaint)
//       ..drawRect(rect, backgroundPaint)
//       ..drawRRect(RRect.fromRectAndRadius(cutOutRect, radius), cutOutPaint)
//       // topLeftVertical
//       ..drawLine(
//           topLeftWithPadding,
//           Offset(topLeftWithPadding.dx, topLeftWithPadding.dy + mBorderLength),
//           cornerBorder)
//       // topLeftHorizontal
//       ..drawLine(
//           topLeftWithPadding,
//           Offset(topLeftWithPadding.dx + mBorderLength, topLeftWithPadding.dy),
//           cornerBorder)
//       // topRightVertical
//       ..drawLine(
//           topRightWithPadding,
//           Offset(
//               topRightWithPadding.dx, topRightWithPadding.dy + mBorderLength),
//           cornerBorder)
//       // topRightHorizontal
//       ..drawLine(
//           topRightWithPadding,
//           Offset(
//               topRightWithPadding.dx - mBorderLength, topRightWithPadding.dy),
//           cornerBorder)
//       // bottomLeftVertical
//       ..drawLine(
//           bottomLeftWithPadding,
//           Offset(bottomLeftWithPadding.dx,
//               bottomLeftWithPadding.dy - mBorderLength),
//           cornerBorder)
//       // bottomLeftHorizontal
//       ..drawLine(
//           bottomLeftWithPadding,
//           Offset(bottomLeftWithPadding.dx + mBorderLength,
//               bottomLeftWithPadding.dy),
//           cornerBorder)
//       // bottomRightVertical
//       ..drawLine(
//           bottomRightWithPadding,
//           Offset(bottomRightWithPadding.dx,
//               bottomRightWithPadding.dy - mBorderLength),
//           cornerBorder)
//       // bottomRightHorizontal
//       ..drawLine(
//           bottomRightWithPadding,
//           Offset(bottomRightWithPadding.dx - mBorderLength,
//               bottomRightWithPadding.dy),
//           cornerBorder)
//       ..restore();
//   }

//   @override
//   ShapeBorder scale(double t) {
//     return _ScannerOverlayShape(
//       overlayColor: overlayColor,
//       cutOutWidth: cutOutWidth,
//       cutOutHeight: cutOutHeight,
//       radius: Radius.zero,
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:mlscanner/ml_card_scanner/src/model/card_orientation.dart';
// import 'dart:math';

// class CameraOverlayWidget extends StatelessWidget {
//   final CardOrientation cardOrientation;
//   final double overlayBorderRadius;
//   final Color overlayColorFilter;

//   const CameraOverlayWidget({
//     required this.cardOrientation,
//     required this.overlayBorderRadius,
//     required this.overlayColorFilter,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.sizeOf(context);

//     return Container(
//       decoration: ShapeDecoration(
//         shape: QrScannerOverlayShape(
//           cutOutHeight: cardOrientation == CardOrientation.portrait
//               ? (size.width * 0.75) * 1.6
//               : (size.width * 0.95) / 1.8,
//           cutOutWidth: cardOrientation == CardOrientation.portrait
//               ? size.width * 0.75
//               : size.width * 0.8,
//           overlayColor: overlayColorFilter,
//           // radius: const Radius.circular(0),
//         ),
//       ),
//     );
//   }
// }

// class QrScannerOverlayShape extends ShapeBorder {
//   QrScannerOverlayShape({
//     this.borderColor = Colors.white,
//     this.borderWidth = 3.0,
//     this.overlayColor = const Color.fromRGBO(0, 0, 0, 80),
//     this.borderRadius = 0,
//     this.borderLength = 40,
//     double? cutOutSize,
//     double? cutOutWidth,
//     double? cutOutHeight,
//     this.cutOutBottomOffset = 0,
//   })  : cutOutWidth = cutOutWidth ?? cutOutSize ?? 250,
//         cutOutHeight = cutOutHeight ?? cutOutSize ?? 250 {
//     assert(
//       borderLength <=
//           min(this.cutOutWidth, this.cutOutHeight) / 2 + borderWidth * 2,
//       "Border can't be larger than ${min(this.cutOutWidth, this.cutOutHeight) / 2 + borderWidth * 2}",
//     );
//     assert(
//         (cutOutWidth == null && cutOutHeight == null) ||
//             (cutOutSize == null && cutOutWidth != null && cutOutHeight != null),
//         'Use only cutOutWidth and cutOutHeight or only cutOutSize');
//   }

//   final Color borderColor;
//   final double borderWidth;
//   final Color overlayColor;
//   final double borderRadius;
//   final double borderLength;
//   final double cutOutWidth;
//   final double cutOutHeight;
//   final double cutOutBottomOffset;

//   @override
//   EdgeInsetsGeometry get dimensions => const EdgeInsets.all(10);

//   @override
//   Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
//     return Path()
//       ..fillType = PathFillType.evenOdd
//       ..addPath(getOuterPath(rect), Offset.zero);
//   }

//   @override
//   Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
//     Path getLeftTopPath(Rect rect) {
//       return Path()
//         ..moveTo(rect.left, rect.bottom)
//         ..lineTo(rect.left, rect.top)
//         ..lineTo(rect.right, rect.top);
//     }

//     return getLeftTopPath(rect)
//       ..lineTo(
//         rect.right,
//         rect.bottom,
//       )
//       ..lineTo(
//         rect.left,
//         rect.bottom,
//       )
//       ..lineTo(
//         rect.left,
//         rect.top,
//       );
//   }

//   @override
//   void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
//     final width = rect.width;
//     final borderWidthSize = width / 2;
//     final height = rect.height;
//     final borderOffset = borderWidth / 2;
//     final mBorderLength =
//         borderLength > min(cutOutHeight, cutOutHeight) / 2 + borderWidth * 2
//             ? borderWidthSize / 2
//             : borderLength;
//     final mCutOutWidth =
//         cutOutWidth < width ? cutOutWidth : width - borderOffset;
//     final mCutOutHeight =
//         cutOutHeight < height ? cutOutHeight : height - borderOffset;

//     final backgroundPaint = Paint()
//       ..color = overlayColor
//       ..style = PaintingStyle.fill;

//     final borderPaint = Paint()
//       ..color = borderColor
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = borderWidth;

//     final boxPaint = Paint()
//       ..color = borderColor
//       ..style = PaintingStyle.fill
//       ..blendMode = BlendMode.dstOut;

//     final cutOutRect = Rect.fromLTWH(
//       rect.left + width / 2 - mCutOutWidth / 2 + borderOffset,
//       -cutOutBottomOffset +
//           rect.top +
//           height / 2 -
//           mCutOutHeight / 2 +
//           borderOffset,
//       mCutOutWidth - borderOffset * 2,
//       mCutOutHeight - borderOffset * 2,
//     );

//     canvas
//       ..saveLayer(
//         rect,
//         backgroundPaint,
//       )
//       ..drawRect(
//         rect,
//         backgroundPaint,
//       )
//       // Draw top right corner
//       ..drawRRect(
//         RRect.fromLTRBAndCorners(
//           cutOutRect.right - mBorderLength,
//           cutOutRect.top,
//           cutOutRect.right,
//           cutOutRect.top + mBorderLength,
//           topRight: Radius.circular(borderRadius),
//         ),
//         borderPaint,
//       )
//       // Draw top left corner
//       ..drawRRect(
//         RRect.fromLTRBAndCorners(
//           cutOutRect.left,
//           cutOutRect.top,
//           cutOutRect.left + mBorderLength,
//           cutOutRect.top + mBorderLength,
//           topLeft: Radius.circular(borderRadius),
//         ),
//         borderPaint,
//       )
//       // Draw bottom right corner
//       ..drawRRect(
//         RRect.fromLTRBAndCorners(
//           cutOutRect.right - mBorderLength,
//           cutOutRect.bottom - mBorderLength,
//           cutOutRect.right,
//           cutOutRect.bottom,
//           bottomRight: Radius.circular(borderRadius),
//         ),
//         borderPaint,
//       )
//       // Draw bottom left corner
//       ..drawRRect(
//         RRect.fromLTRBAndCorners(
//           cutOutRect.left,
//           cutOutRect.bottom - mBorderLength,
//           cutOutRect.left + mBorderLength,
//           cutOutRect.bottom,
//           bottomLeft: Radius.circular(borderRadius),
//         ),
//         borderPaint,
//       )
//       ..drawRRect(
//         RRect.fromRectAndRadius(
//           cutOutRect,
//           Radius.circular(borderRadius),
//         ),
//         boxPaint,
//       )
//       ..restore();
//   }

//   @override
//   ShapeBorder scale(double t) {
//     return QrScannerOverlayShape(
//       borderColor: borderColor,
//       borderWidth: borderWidth,
//       overlayColor: overlayColor,
//     );
//   }
// }
