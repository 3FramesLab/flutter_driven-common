part of driven_components_module;

class HorizontalSpacer extends StatelessWidget {
  final double size;

  const HorizontalSpacer({required this.size});
  const HorizontalSpacer.small() : size = 10;
  const HorizontalSpacer.medium() : size = 20;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: size);
  }
}

class VerticalSpacer extends StatelessWidget {
  final double size;

  const VerticalSpacer({required this.size});
  const VerticalSpacer.small() : size = 10;
  const VerticalSpacer.medium() : size = 20;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size);
  }
}
