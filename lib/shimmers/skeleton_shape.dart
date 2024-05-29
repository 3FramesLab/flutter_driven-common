part of shimmer_module;

class SkeletonShape extends StatelessWidget {
  final double width;
  final double height;

  const SkeletonShape({
    super.key,
    required this.height,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: DrivenColors.shimmerBarColor,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
      );
}
