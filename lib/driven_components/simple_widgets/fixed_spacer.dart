part of driven_components_module;

class HorizontalSpacer extends StatelessWidget {
  final double size;

  const HorizontalSpacer({required this.size, super.key});
  const HorizontalSpacer.small({super.key}) : size = 10;
  const HorizontalSpacer.medium({super.key}) : size = 20;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: size);
  }
}

class VerticalSpacer extends StatelessWidget {
  final double size;

  const VerticalSpacer({super.key, required this.size});
  const VerticalSpacer.small({super.key}) : size = 10;
  const VerticalSpacer.medium({super.key}) : size = 20;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size);
  }
}
