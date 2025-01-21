part of driven_components_module;

class SvgImage extends StatelessWidget {
  final String svgPath;
  final double height;
  final double width;

  const SvgImage({
    super.key,
    required this.svgPath,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      height: height,
      width: width,
    );
  }
}
