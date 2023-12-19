part of driven_components_module;

class LabelText extends StatelessWidget {
  final String label;
  const LabelText(this.label);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      child: Text(
        label,
        style: f14SemiboldGrey,
      ),
    );
  }
}
