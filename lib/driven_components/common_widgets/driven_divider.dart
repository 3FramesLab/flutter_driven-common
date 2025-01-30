part of driven_components_module;

class DrivenDivider extends StatelessWidget {
  final double? height;
  final double? thickness;
  final Color? color;

  const DrivenDivider({
    Key? key,
    this.height,
    this.thickness = 1,
    this.color = DrivenColors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      thickness: thickness,
      height: height,
    );
  }
}
