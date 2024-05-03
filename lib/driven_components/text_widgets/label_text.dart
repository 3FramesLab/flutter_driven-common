part of driven_components_module;

class LabelText extends StatelessWidget {
  final String label;
  const LabelText(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      label: label,
      child: Text(
        label,
        style: f14SemiboldGrey,
      ),
    );
  }
}
