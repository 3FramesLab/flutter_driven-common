part of driven_components_module;

class CustomCircularLoader extends StatefulWidget {
  final Color loaderColor;
  final Color? backgroundColor;
  final int loadingTime;
  const CustomCircularLoader(
      {required this.loaderColor,
      required this.backgroundColor,
      this.loadingTime = 1000,
      super.key});

  @override
  State<CustomCircularLoader> createState() => _CustomCircularLoaderState();
}

class _CustomCircularLoaderState extends State<CustomCircularLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.loadingTime))
      ..repeat();
    animation = Tween<double>(begin: 0, end: 360).animate(controller)
      ..addListener(() {});
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.backgroundColor ?? DrivenColors.white,
      ),
      child: RotationTransition(
        turns: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(controller),
        child: CustomPaint(
          painter: CirclePaint(
            secondaryColor: widget.loaderColor,
            primaryColor: widget.loaderColor.withOpacity(0.5),
            strokeWidth: 6,
          ),
          size: const Size(60, 60),
        ),
      ),
    );
  }
}

class CirclePaint extends CustomPainter {
  final Color secondaryColor;
  final Color primaryColor;
  final double strokeWidth;

  double _degreeToRad(double degree) => degree * math.pi / 180;

  CirclePaint({
    this.secondaryColor = Colors.grey,
    this.primaryColor = Colors.blue,
    this.strokeWidth = 15,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double centerPoint = size.height / 2;

    final Paint paint = Paint()
      ..color = primaryColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    paint.shader = SweepGradient(
      colors: [secondaryColor, primaryColor],
      tileMode: TileMode.repeated,
      startAngle: _degreeToRad(270),
      endAngle: _degreeToRad(270 + 360.0),
    ).createShader(
        Rect.fromCircle(center: Offset(centerPoint, centerPoint), radius: 0));

    final scapSize = strokeWidth * 0.70;
    final double scapToDegree = scapSize / centerPoint;

    final double startAngle = _degreeToRad(270) + scapToDegree;
    final double sweepAngle = _degreeToRad(360) - (2 * scapToDegree);

    canvas.drawArc(const Offset(0, 0) & Size(size.width, size.width),
        startAngle, sweepAngle, false, paint..color = primaryColor);
  }

  @override
  bool shouldRepaint(CirclePaint oldDelegate) {
    return true;
  }
}