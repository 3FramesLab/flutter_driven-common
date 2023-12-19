part of driven_components_module;

class LoadingText extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? width;

  const LoadingText({
    required this.height,
    required this.width,
    this.margin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
          color: DrivenColors.shimmerGrey,
          border: Border.all(color: DrivenColors.shimmerGrey),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      height: height,
      width: width,
    );
  }
}
