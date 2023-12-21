part of driven_components_module;

class CreditCheckInfoText extends StatelessWidget {
  final String label;
  const CreditCheckInfoText(this.label, {super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(label, style: f14RegularGrey),
        ),
        const SizedBox.shrink(),
      ],
    );
  }
}
