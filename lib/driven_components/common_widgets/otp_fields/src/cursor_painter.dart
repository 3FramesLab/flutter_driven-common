part of '../otp_fields.dart';

class CursorPainter extends CustomPainter {
  final Color cursorColor;
  final double cursorWidth;
  List<String>? logs = [];

  CursorPainter({
    this.cursorColor = DrivenColors.blue,
    this.cursorWidth = 2,
    this.logs,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const startOffset = Offset(0, 0);
    final endOffset = Offset(0, size.height);
    final paint = Paint()
      ..color = cursorColor
      ..strokeWidth = cursorWidth;
    canvas.drawLine(startOffset, endOffset, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
