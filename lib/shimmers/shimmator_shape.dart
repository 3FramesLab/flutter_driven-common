part of shimmer_module;

class ShimmatorShape extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;
  final bool isPurple;

  const ShimmatorShape.rectangular({
    required this.height,
    this.width = double.infinity,
    this.isPurple = false,
    super.key,
  }) : shapeBorder = const RoundedRectangleBorder();

  const ShimmatorShape.roundedRectangular({
    required this.height,
    this.width = double.infinity,
    this.isPurple = false,
    super.key,
  }) : shapeBorder = const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)));

  const ShimmatorShape.circular({
    required this.height,
    this.width = double.infinity,
    this.isPurple = false,
    this.shapeBorder = const CircleBorder(),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color baseColor = const Color(0xFFF0F0F0);
    Color highlightColor = Colors.grey[300]!;
    Color shapeColor = Colors.grey[100]!;

    if (isPurple) {
      baseColor = Colors.purple[100]!;
      highlightColor = DrivenColors.brandPurple;
      shapeColor = Colors.purple[100]!;
    }
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: shapeColor,
          shape: shapeBorder,
        ),
      ),
    );
  }
}
